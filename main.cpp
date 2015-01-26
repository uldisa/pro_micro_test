// Warning! when using with optiboot, flash memory limit is 7680
#include <Arduino.h>

void setup() {
  // put your setup code here, to run once:
pinMode(0,OUTPUT);
 pinMode(1,OUTPUT);
 TX_RX_LED_INIT;
}

void loop() {
  // put your main code here, to run repeatedly: 
 digitalWrite(0,LOW);
 digitalWrite(1,HIGH);
 TXLED1;
 RXLED0;
 delay(100);
 digitalWrite(0,HIGH);
 digitalWrite(1,LOW);
 TXLED0;
 RXLED1;
 delay(100);  
}

int main(void)
{
	init();

#if defined(USBCON)
	USBDevice.attach();
#endif
	
	setup();
    
	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}
        
	return 0;
}
