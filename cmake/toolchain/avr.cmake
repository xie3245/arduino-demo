set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_CROSSCOMPILING TRUE)
set(BUILD_SHARED_LIBS FALSE)

set(CMCU "-mmcu=atmega328p")
set(CDEFS "-DF_CPU=16000000UL")
set(COPT "-Os -Wl,-gc-sections -ffunction-sections -fdata-sections -Wall")
set(CFLAGS "${COPT} ${CMCU} ${CDEFS}")

SET(CMAKE_C_COMPILER avr-gcc)
SET(CMAKE_CXX_COMPILER avr-g++)
SET(CMAKE_ASM_COMPILER avr-gcc)
SET(CMAKE_AR avr-ar)
SET(CMAKE_LINKER avr-ld)

SET(CMAKE_C_FLAGS "${CFLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")