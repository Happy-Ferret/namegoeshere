#!/bin/bash

BUILD_DIR="build/debug"

OUTPUT_FILE=$(cd $BUILD_DIR && make $@ | tee /dev/tty | awk '/Built target/ {print $4}')

if [ $? -eq 0 ] && [ ${#@} -eq 0 ]; then
	rm ${OUTPUT_FILE} 2> /dev/null
	ln -s ${BUILD_DIR}/${OUTPUT_FILE}
fi
