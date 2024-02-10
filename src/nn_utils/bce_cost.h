#pragma once
#include "nn_utils/matrix.h"

class BCECost {
public:
	float cost(Matrix predictions, Matrix target);
	Matrix dCost(Matrix predictions, Matrix target, Matrix dY);
};
