#!/bin/bash

BUILD_TYPE="debug"

for i in "$@"; do
	case $i in
	    release)
			BUILD_TYPE="release"
		    shift
	    ;;
	    *)
	        # unknown option
	    ;;
	esac
done

BUILD_DIR="build/${BUILD_TYPE}"

BUILD_BINARY_CACHE=".make_${BUILD_TYPE}_binaries"

OUTPUT_FILE=$(cd $BUILD_DIR && make $@ | tee /dev/tty | awk '/Built target/ {print $4}')

BUILD_STATUS=$?

if [ $BUILD_STATUS -eq 0 ] && [ ${#@} -eq 0 ]; then
	OUTPUT_FILE="${OUTPUT_FILE}-${BUILD_TYPE}"

	rm ${OUTPUT_FILE} 2> /dev/null
	echo ${OUTPUT_FILE} > $BUILD_BINARY_CACHE
	ln -s ${BUILD_DIR}/${OUTPUT_FILE}
fi

if [ -e $BUILD_BINARY_CACHE ] && [[ "$1" == "clean" || $BUILD_STATUS -ne 0 ]]; then
	BINARIES=$(cat $BUILD_BINARY_CACHE)
	rm $BUILD_BINARY_CACHE

	for f in $BINARIES; do
		rm $f
	done
fi
