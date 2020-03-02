#pragma once

// Include packages
#include <iostream>
#include <string>

#include "../../LVDSControlSolution.h"

namespace core {
	class LVDSCONTROLSOLUTION_API AnokiClassImp : public AnokiClass {
	public:
		AnokiClassImp();
		virtual ~AnokiClassImp();

		std::string Say();
		double calculator(const double a);

		static double add(const double a);
	};
}

extern "C" LVDSCONTROLSOLUTION_API core::AnokiClassImp * __cdecl CreateAnokiClass() {
	return new core::AnokiClassImp;
}
