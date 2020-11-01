#include "demo.hxx"

namespace demo
{

OutputPin::OutputPin(AddressType data_reg, AddressType port_add, uint8_t data_reg_pos, uint8_t pin_pos):
  m_data_reg(data_reg), m_port_add(port_add), m_data_reg_pos(data_reg_pos), m_pin_pos(pin_pos)
{
    m_data_reg |= (1 << m_data_reg_pos);
} 

void OutputPin::pin_high() {
        m_port_add |= (1 << m_pin_pos);
}

void OutputPin::pin_low() {
        m_port_add &= ~(1 << m_pin_pos);
}
}