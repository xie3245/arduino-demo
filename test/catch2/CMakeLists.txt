
add_library(catch_main STATIC ${CMAKE_CURRENT_SOURCE_DIR}/catch_main.cxx)
add_library(Catch2::Catch2 ALIAS catch_main)

target_include_directories(catch_main PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")