INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# TODO: configure linker
find_program(AVRCPP avr-g++)
find_program(AVRC avr-gcc)
find_program(AVRAR avr-ar)
find_program(AVRLD avr-ld)
find_program(AVRSTRIP avr-strip)
find_program(OBJCOPY avr-objcopy)
find_program(OBJDUMP avr-objdump)
find_program(AVRSIZE avr-size)
find_program(AVRDUDE avrdude)
find_program(SCREEN screen)
#find_program(AVRASM avr-as)

# Tools. Without the FORCE, CMAKE overwrites them somehow...
SET(CMAKE_C_COMPILER ${AVRC} CACHE STRING "" FORCE)
SET(CMAKE_CXX_COMPILER ${AVRCPP} CACHE STRING "" FORCE)
SET(CMAKE_ASM_COMPILER ${AVRC} CACHE STRING "" FORCE)
SET(CMAKE_AR ${AVRAR} CACHE STRING "" FORCE)
SET(CMAKE_LINKER ${AVRLD} CACHE STRING "" FORCE)


SET(CMAKE_BUILD_TYPE debug)

SET(CSTANDARD "-std=gnu99")
SET(CWARN "-Wall")
SET(CTUNING "")
SET(CDEBUG "")
#SET(COPT "-Os -flto -fuse-linker-plugin")
SET(COPT "-Os -Wl,-gc-sections -ffunction-sections -fdata-sections")
SET(CMCU "-mmcu=atmega328p")
SET(CDEFS "-DF_CPU=16000000UL")
SET(LINK "-T ${LINKER_SCRIPT}")
SET(CFLAGS "-nostartfiles ${CMCU} ${CDEBUG} ${CWARN} ${CTUNING} ${COPT} ${CSTANDARD} ${CDEFS} ${LINK}")
#SET(CFLAGS "${CMCU} ${CDEBUG} ${CWARN} ${CTUNING} ${COPT} ${CSTANDARD} ${CDEFS}")
SET(ASMFLAGS "${CMCU}")
SET(ASM_OPTIONS "-x assembler-with-cpp")

SET(CMAKE_C_FLAGS "${CFLAGS}" CACHE STRING "" FORCE)
SET(CMAKE_ASM_FLAGS "${ASM_OPTIONS} ${CFLAGS}" CACHE STRING "" FORCE)

SET(CMAKE_AR_FLAGS "${CMAKE_AR_FLAGS} csrv" CACHE STRING "" FORCE)

set(CMAKE_PREFIX_PATH /usr)
set(CMAKE_FIND_LIBRARY_PREFIXES lib)
set(CMAKE_FIND_LIBRARY_SUFFIXES .a)
set(CMAKE_CROSSCOMPILING TRUE)
set(LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/scripts/ldscript.ld")
set(HEADERS_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/include/libaavr")

#set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -laavr -flto --fuse-linker-plugin")

SET(AVRLIBC_FILES c m)

foreach(FILE ${AVRLIBC_FILES})
	find_library(LIBTEMP ${FILE} HINTS /usr/lib/avr/lib /usr/local/cellar/avr-libc/1.8.1/avr/lib /usr/local/Cellar/avr-libc/2.0.0/avr/lib REQUIRED)
	if(NOT LIBTEMP)
		message("-- ERROR: Library not found ${FILE}")
		return()
	endif()
	set(AVRLIBC "${AVRLIBC} ${LIBTEMP}")
endforeach()
message("-- AVR-libc library found")