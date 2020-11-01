
add_library(demo_lib STATIC "${CMAKE_CURRENT_SOURCE_DIR}/demo.cxx")
add_library(Demo::Lib ALIAS demo_lib)
target_include_directories(demo_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if(${ARDUINO})

add_executable (demo  "${CMAKE_CURRENT_SOURCE_DIR}/main.cxx")
target_link_libraries(demo PRIVATE Demo::Lib)

endif()

