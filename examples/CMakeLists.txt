
include(ExtGoogleTest.cmake)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)

find_package(Threads REQUIRED)

file(GLOB_RECURSE EXAMPLES_SOURCES *.cpp *.h)

add_executable(examples ${EXAMPLES_SOURCES})
target_link_libraries(examples gmock gtest)

#-fsanitize=thread
#SET( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=thread -g" )
#SET( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=thread -g" )