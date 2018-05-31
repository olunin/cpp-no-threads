#cmake_minimum_required(VERSION 3.5)

add_subdirectory(threading)
add_subdirectory(diamond)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)

find_package (Threads REQUIRED)

#file(GLOB_RECURSE THREADING_SOURCES *.cpp *.h)

#add_executable(threading ${THREADING_SOURCES})
#target_link_libraries(threading Threads::Threads)

#-fsanitize=thread
#SET( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=thread -g" )
#SET( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=thread -g" )