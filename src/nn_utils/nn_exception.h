#pragma once

#include <exception>
#include <iostream>

class NNException : std::exception {
private:
	const char* exception_message;

public:
	NNException(const char* exception_message) :
		exception_message(exception_message)
	{ }

	virtual const char* what() const throw()
	{
		return exception_message;
	}

	static void throwIfDeviceErrorsOccurred(const char* exception_message);
};
