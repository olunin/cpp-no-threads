
find_package(Threads REQUIRED)
include(ExternalProject)

ExternalProject_Add(
        ext_gtest
        GIT_REPOSITORY    https://github.com/google/googletest.git
        GIT_TAG           release-1.8.0
        PREFIX            ${CMAKE_CURRENT_BINARY_DIR}/gtest
)

ExternalProject_Get_Property(ext_gtest SOURCE_DIR BINARY_DIR)

add_library(gtest IMPORTED STATIC GLOBAL)
add_dependencies(gtest ext_gtest)

set_property(TARGET gtest PROPERTY IMPORTED_LOCATION ${BINARY_DIR}/googletest/libgtest.a)
#set_property(TARGET gtest APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${SOURCE_DIR}/googletest/include)

add_library(gmock IMPORTED STATIC GLOBAL)
add_dependencies(gmock ext_gtest)

set_property(TARGET gmock PROPERTY IMPORTED_LOCATION ${BINARY_DIR}/googlemock/libgmock.a)
#set_property(TARGET gmock APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${SOURCE_DIR}/googlemock/include)

#include_directories("${source_dir}/googletest/include"
 #       "${source_dir}/googlemock/include")