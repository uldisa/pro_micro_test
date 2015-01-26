set -x
#CLOCK=4000000L
#BAUD=19200
CLOCK=16000000L
BAUD=57600
CHIP=atmega32u4

avrdude -v -v  -P COM12 -b 19200 -c avrisp -p ${CHIP} -C "C:/Program Files/Arduino/hardware/tools/avr/etc/avrdude.conf" -u  -e || exit $?
avrdude -v -v -P COM12 -b 19200 -c avrisp -p ${CHIP} -C "C:/Program Files/Arduino/hardware/tools/avr/etc/avrdude.conf" -u  -U lfuse:w:0xff:m -U hfuse:w:0xd9:m -U efuse:w:0xCB:m -U lock:w:0x3f:m || exit $?
#avrdude  -P COM12 -b 19200 -c avrisp -p m8 -C "C:/Program Files/Arduino/hardware/tools/avr/etc/avrdude.conf"  -U flash:w:optiboot_${CHIP}.hex -U lock:w:0x2f:m || exit $?
