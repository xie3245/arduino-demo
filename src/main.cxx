#include "demo.hxx"
#include <avr/io.h>
#include <util/delay.h>


int main(int, char**)
{
    demo::OutputPin led(DDRB, PORTB, DDB5, PORTB5);

    while(1) {
        led.pin_high();
        _delay_ms(1000);
        led.pin_low();
        _delay_ms(1000);
    }

	return 0;
}