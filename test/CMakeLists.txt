
set(CATCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/catch2)
set(CATCH_MAIN_FILE ${CATCH_DIR}/catch_main.cxx)

include_directories(${CATCH_DIR})
add_subdirectory(catch2)
add_subdirectory(unittests)