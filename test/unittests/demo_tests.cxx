#include<catch.hpp>
#include<vector>
#include<iostream>

TEST_CASE("Demo")
{
	using namespace std;

	SECTION("dummy")
	{
		REQUIRE(1 == true);
	}
}