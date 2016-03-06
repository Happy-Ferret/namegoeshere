project("namegoeshere" C)
# hehehe
cmake_minimum_required(VERSION 3.4)

set(BUILD_ROOT ${CMAKE_SOURCE_DIR})
set(PROJECT_ROOT ${CMAKE_SOURCE_DIR}/.. CACHE FILEPATH "description")
set(SRC_ROOT ${PROJECT_ROOT}/src CACHE FILEPATH "description")
set(RES_ROOT ${PROJECT_ROOT}/res CACHE FILEPATH "description")

set(CMAKE_CURRENT_SOURCE_DIR ${PROJECT_ROOT})
set(CMAKE_SOURCE_DIR ${PROJECT_ROOT})

#file (GLOB VALA_PKG  ${CMAKE_SOURCE_DIR}/src/*.vala)

#valac -c $VALA_PKG --pkg gtk+-3.0 --pkg webkit2gtk-4.0 --glib-bla 2.38
#--gresources blabla

#gcc my-resources.c mywidget.c namegoeshere.c -Wall \
#	`pkg-config --cflags gtk+-3.0 --libs gtk+-3.0 gmodule-export-2.0` -o lele2

list(APPEND CMAKE_MODULE_PATH
	${BUILD_ROOT}/cmake/vala
	${BUILD_ROOT}/cmake/GCR_CMake/macros
	${BUILD_ROOT}/cmake/gresource
)

# TODO: use https://github.com/Makman2/GCR_CMake to generate xml automatically

find_package(VALA REQUIRED)
include(${VALA_USE_FILE})

find_package(PkgConfig)
pkg_check_modules(GTK REQUIRED gtk+-3.0
	webkit2gtk-4.0)
add_definitions(${GTK_CFLAGS} ${GTK_CFLAGS_OTHER})
link_libraries(${GTK_LIBRARIES})
link_directories(${GTK_LIBRARY_DIRS})

include(GlibCompileResourcesSupport)

# Set the resources to bundle.
set(RESOURCE_LIST
    ui/browserwindow.ui
   )

# Compile the resources.
compile_gresources(RESOURCE_FILE
                   XML_OUT
                   TARGET src/gresources.c
                   TYPE EMBED_C
                   PREFIX /de/uni-frankfurt/namegoeshere
                   SOURCE_DIR ${RES_ROOT}
                   RESOURCES ${RESOURCE_LIST})

# Add a custom target to the makefile. Now make builds our resource file.
# It depends on the output RESOURCE_FILE.
add_custom_target(resource ALL DEPENDS ${RESOURCE_FILE})

message("Resource file is ${XML_OUT}")

vala_precompile(VALA_C
SOURCES
	src/browsertabsign.vala
	src/browsernotebook.vala
	src/browserwindow.vala
	src/namegoeshere.vala
PACKAGES
	gtk+-3.0
	webkit2gtk-4.0
OPTIONS
	--target-glib=2.38
    --gresources ${XML_OUT}
)

SET(CMAKE_CXX_FLAGS "-Wall")
SET(CMAKE_CXX_FLAGS_RELEASE "-O2")
SET(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")

message("CMAKE_BUILD_TYPE is ${CMAKE_BUILD_TYPE}")

message("CMAKE_CXX_FLAGS is ${CMAKE_CXX_FLAGS}")

if(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
	message("CMAKE_CXX_FLAGS_DEBUG is ${CMAKE_CXX_FLAGS_DEBUG}")
else()
	message("CMAKE_CXX_FLAGS_RELEASE is ${CMAKE_CXX_FLAGS_RELEASE}")
endif()

add_executable("namegoeshere" ${VALA_C} ${RESOURCE_FILE})
