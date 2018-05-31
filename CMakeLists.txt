cmake_minimum_required(VERSION 3.5)

find_package(Threads REQUIRED)

# gtest

include(ExternalProject)

ExternalProject_Add(
        ext_gtest
        GIT_REPOSITORY    https://github.com/google/googletest.git
        GIT_TAG           release-1.8.0
        PREFIX            ${CMAKE_CURRENT_BINARY_DIR}/gtest
        CMAKE_ARGS += -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/gtest
)

ExternalProject_Get_Property(ext_gtest INSTALL_DIR)

file(MAKE_DIRECTORY ${INSTALL_DIR}/include)

add_library(gtest IMPORTED STATIC GLOBAL)
set_property(TARGET gtest PROPERTY IMPORTED_LOCATION ${INSTALL_DIR}/lib/libgtest.a)
set_property(TARGET gtest PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${INSTALL_DIR}/include)
add_dependencies(gtest ext_gtest)

add_library(gmock IMPORTED STATIC GLOBAL)
set_property(TARGET gmock PROPERTY IMPORTED_LOCATION ${INSTALL_DIR}/lib/libgmock.a)
set_property(TARGET gmock PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${INSTALL_DIR}/include)
add_dependencies(gmock ext_gtest)

add_library(gmock_main IMPORTED STATIC GLOBAL)
set_property(TARGET gmock_main PROPERTY IMPORTED_LOCATION ${INSTALL_DIR}/lib/libgmock_main.a)
add_dependencies(gmock_main ext_gtest)

# examples

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)

file(GLOB_RECURSE EXAMPLES_SOURCES examples/*.cpp examples/*.h)

add_executable(examples ${EXAMPLES_SOURCES})
target_link_libraries(examples gmock_main gmock gtest)

# sanitizer

SET( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=thread -g" )
SET( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=thread -g" )