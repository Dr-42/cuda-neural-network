#pragma once

#include <vector>
#include "layers/nn_layer.h"
#include "nn_utils/bce_cost.h"

class NeuralNetwork {
private:
	std::vector<NNLayer*> layers;
	BCECost bce_cost;

	Matrix Y;
	Matrix dY;
	float learning_rate;

public:
	NeuralNetwork(float learning_rate = 0.01);
	~NeuralNetwork();

	Matrix forward(Matrix X);
	void backprop(Matrix predictions, Matrix target);

	void addLayer(NNLayer *layer);
	std::vector<NNLayer*> getLayers() const;

};
