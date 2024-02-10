#include "nn_utils/nn_exception.h"

void NNException::throwIfDeviceErrorsOccurred(const char* exception_message) {
	cudaError_t error = cudaGetLastError();
	if (error != cudaSuccess) {
		std::cerr << error << ": " << exception_message;
		throw NNException(exception_message);
	}
}
