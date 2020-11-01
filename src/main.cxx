#include <avr/io.h>
#include <util/delay.h>

int main(int argc, char** argv)
{
    DDRB |= (1 << DDB5);

    while(1) {
        PORTB |= (1 << PORTB5);
        _delay_ms(1000);
        PORTB &= ~(1 << PORTB5);
        _delay_ms(2000);
    }

	return 0;
}