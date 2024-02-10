#pragma once

#include <cstddef>
using std::size_t;

struct Shape {
	size_t x, y;

	Shape(size_t x = 1, size_t y = 1);
};
