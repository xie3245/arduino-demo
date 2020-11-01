add_library(demo_lib STATIC "${CMAKE_CURRENT_SOURCE_DIR}/demo.cxx")
add_library(Embedded::Demo ALIAS demo_lib)

set(LIBAAVR_PATH ""${PROJECT_SOURCE_DIR}/aavrlib")
target_include_directories(demo_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} SYSTEM "${LIBAAVR_PATH}/include")

add_executable (demo  "${CMAKE_CURRENT_SOURCE_DIR}/main.cxx")
target_link_libraries(demo PRIVATE Embedded::Demo ${AVRLIBC_FILES} aavr)
#target_link_directories(demo PUBLIC "${LIBAAVR_PATH}/build/bin/lib")