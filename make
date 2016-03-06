#!/bin/bash

BINARY="namegoeshere"

BUILD_TYPES="debug"

for i in "$@"; do
	case $i in
	    release)
			BUILD_TYPES="release"
		    shift
	    ;;
	    debug)
			BUILD_TYPES="debug"
		    shift
	    ;;
	    all)
			BUILD_TYPES="${BUILD_TYPES} release"
		    shift
		;;
	    *)
	        # unknown option
	    ;;
	esac
done

build(){

	BUILD_TYPE=$1
	shift

	if [ "$1" != "clean" ]; then
		echo "Building target ${BUILD_TYPE}"
	fi

	BUILD_DIR="build/${BUILD_TYPE}"

	# BUILD_BINARY_CACHE=".make_${BUILD_TYPE}_binaries"

	(cd $BUILD_DIR && make $@)

	BUILD_STATUS=$?

	OUTPUT_FILE_NAME="${BINARY}-${BUILD_TYPE}"

	if [ $BUILD_STATUS -eq 0 ] && [ "$1" != "clean" ]; then
		rm ${OUTPUT_FILE_NAME} 2> /dev/null
		# echo ${OUTPUT_FILE_NAME} > $BUILD_BINARY_CACHE
		ln -s ${BUILD_DIR}/${BINARY} ${OUTPUT_FILE_NAME}
	fi

	#if [ -e $BUILD_BINARY_CACHE ] && [[ "$1" == "clean" || $BUILD_STATUS -ne 0 ]]; then
	if [[ "$1" == "clean" || $BUILD_STATUS -ne 0 ]]; then
		#BINARIES=$(cat $BUILD_BINARY_CACHE)
		#rm $BUILD_BINARY_CACHE

		#for f in $BINARIES; do
		#	rm $f
		#done

		rm $OUTPUT_FILE_NAME 2> /dev/null
	fi

}

for t in $BUILD_TYPES; do
	build $t $@
done
