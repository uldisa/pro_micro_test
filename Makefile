include Arduino.mk

LIBS=core
#PORT=/dev/ttyUSB0
#PORT=COM12
PORT=COM7
CPU=atmega32u4
BR=57600
USB_CFLAGS=-DUSB_VID=0x2341 -DUSB_PID=0x8037 -DUSB_MANUFACTURER= -DUSB_PRODUCT='"Arduino Micro"'
CPPFLAGS+=-DARDUINO_AVR_MICRO -DARDUINO_ARCH_AVR -DF_CPU=16000000L $(USB_CFLAGS)
VARIANT=micro
PROGRAMMER=avr109

USER_LIB_PATH=$(CURDIR)/libraries
#WIRE_LIB_PATH=$(ARD_HOME)/hardware/arduino/avr/libraries/Wire
include lib.mk

#ifeq ($(filter %-pc-cygwin,$(MAKE_HOST)),)
#CPPFLAGS+=-I$(WIRE_LIB_PATH) -I$(WIRE_LIB_PATH)/utility
#else
#CPPFLAGS+=-I$(shell cygpath -m $(WIRE_LIB_PATH)) -I$(shell cygpath -m $(WIRE_LIB_PATH)/utility)
#endif

#CPPFLAGS+=-Wall -Wextra -I. -Os -fno-exceptions -ffunction-sections -fdata-sections
CPPFLAGS+=-I. -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD

main.o:
main.elf: main.o libcore.a
