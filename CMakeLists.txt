#cmake try...

cmake_minimum_required(VERSION 3.1)

option(ARDUINO "enable arduino build" OFF)

if(${ARDUINO})
  set(CMAKE_TOOLCHAIN_FILE cmake/toolchain/avr.cmake)
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(demo LANGUAGES C CXX ASM)

message("ARDUINO: ${ARDUINO}")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/modules")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")


add_subdirectory(src)
if(NOT ${ARDUINO})
  enable_testing()
  add_subdirectory( test )
endif()

