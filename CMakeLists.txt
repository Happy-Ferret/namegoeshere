project("lele" C)
# hehehe
cmake_minimum_required(VERSION 3.4)

file (GLOB VALA_PKG  ${CMAKE_SOURCE_DIR}/src/*.vala)

#valac -c $VALA_PKG --pkg gtk+-3.0 --pkg webkit2gtk-4.0 --glib-bla 2.38
#--gresources blabla

#gcc my-resources.c mywidget.c namegoeshere.c -Wall \
#	`pkg-config --cflags gtk+-3.0 --libs gtk+-3.0 gmodule-export-2.0` -o lele2

list(APPEND CMAKE_MODULE_PATH
	${CMAKE_SOURCE_DIR}/cmake/vala
	${CMAKE_SOURCE_DIR}/cmake/GCR_CMake/macros
	${CMAKE_SOURCE_DIR}/cmake/gresource
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

include(GResource)
gresource(${CMAKE_CURRENT_SOURCE_DIR}/res gresources.xml
	${CMAKE_BINARY_DIR} RESOURCE_FILE)

vala_precompile(VALA_C
	src/browsertabsign.vala
	src/browsertab.vala
	src/browserwindow.vala
	src/namegoeshere.vala
PACKAGES
	gtk+-3.0
	webkit2gtk-4.0
OPTIONS
	--target-glib=2.38
	--gresources res/gresources.xml
)

add_executable("namegoeshere" ${VALA_C} ${RESOURCE_FILE})
