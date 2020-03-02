//#include "../../pch.h"
#include "pch.h"

#include "../include/AnokiClass.h"

namespace core {
	AnokiClassImp::AnokiClassImp() {
	}

	AnokiClassImp::~AnokiClassImp() {

	}

	std::string AnokiClassImp::Say() {
		return "Prank!";
	}

	double AnokiClassImp::calculator(double a) {
		return a + 5;
	}

}
