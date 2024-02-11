#include "coordinates_dataset.h"

CoordinatesDataset::CoordinatesDataset(size_t batch_size, size_t number_of_batches) :
	number_of_batches(number_of_batches)
{
	for (size_t i = 0; i < number_of_batches; i++) {
		batches.push_back(Matrix(Shape(batch_size, 2)));
		targets.push_back(Matrix(Shape(batch_size, 1)));

		batches[i].allocateMemory();
		targets[i].allocateMemory();

		for (size_t k = 0; k < batch_size; k++) {
			batches[i][k] = static_cast<float>(rand()) / static_cast<float>(RAND_MAX) - 0.5;
			batches[i][batches[i].shape.x + k] = static_cast<float>(rand()) / static_cast<float>(RAND_MAX) - 0.5;;

			if ( (batches[i][k] > 0 && batches[i][batches[i].shape.x + k] > 0) ||
				 ((batches[i][k] < 0 && batches[i][batches[i].shape.x + k] < 0)) ) {
				targets[i][k] = 1;
			}
			else {
				targets[i][k] = 0;
			}
		}

		batches[i].copyHostToDevice();
		targets[i].copyHostToDevice();
	}
}

int CoordinatesDataset::getNumOfBatches() {
	return number_of_batches;
}

std::vector<Matrix>& CoordinatesDataset::getBatches() {
	return batches;
}

std::vector<Matrix>& CoordinatesDataset::getTargets() {
	return targets;
}
