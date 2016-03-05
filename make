#!/bin/bash

BUILD_DIR="build/debug"

OUTPUT=$(cd $BUILD_DIR && make $@)

OUTPUT_FILE=$(echo $OUTPUT | awk '/Built target/ {print $4}')

if [ $? -eq 0 ] && [ ${#@} -eq 0 ]; then
	rm ${OUTPUT_FILE}
	ln -s ${BUILD_DIR}/${OUTPUT_FILE}
fi
