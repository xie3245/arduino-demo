#ifndef ARDUINO_DEMO_HXX
#define ARDUINO_DEMO_HXX

#include <stdint.h>

namespace demo 
{
class OutputPin final {
public:
    using AddressType = volatile uint8_t&;
    OutputPin(AddressType data_reg, AddressType port_add, const uint8_t data_reg_pos, const uint8_t pin_pos);

    void pin_high();

    void pin_low();

private:
    AddressType m_data_reg;
    AddressType m_port_add;
    const uint8_t m_data_reg_pos;
    const uint8_t m_pin_pos;

};

void delay_ms(const uint8_t delay);

}
#endif