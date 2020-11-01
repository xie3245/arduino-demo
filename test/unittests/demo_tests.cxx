#include<catch.hpp>
#include "demo.hxx"

TEST_CASE("Demo")
{
	volatile uint8_t test_data_reg = 12;
	volatile uint8_t test_port_reg = 64;
	const uint8_t data_pos = 2;
	const uint8_t pin_pos = 5;
	
	SECTION("pin init")
	{
		demo::OutputPin pin(test_data_reg, test_port_reg, data_pos, pin_pos);
		const uint8_t output_mode = test_data_reg |= (1 << data_pos);
		REQUIRE(output_mode == test_data_reg);
	}

	SECTION("pin high")
	{
		demo::OutputPin pin(test_data_reg, test_port_reg, data_pos, pin_pos);
		const uint8_t high = test_port_reg |= (1 << pin_pos);
		REQUIRE(high == test_port_reg);
	}

	SECTION("pin low")
	{
		demo::OutputPin pin(test_data_reg, test_port_reg, data_pos, pin_pos);
		const uint8_t low = test_port_reg &= ~(1 << data_pos);
		REQUIRE(low == test_port_reg);
	}
}