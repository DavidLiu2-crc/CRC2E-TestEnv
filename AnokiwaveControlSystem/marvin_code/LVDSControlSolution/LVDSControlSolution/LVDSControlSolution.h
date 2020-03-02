/**
	File name: LVDSControlSolution.h

	Summary: Include file for control solution API used to control Marvin Digital IO card
			 with user-defined classes AnokiObj, AnokiCommand, AnokiMemory
*/

#pragma once

// DLL Export and Import symbol macro
#ifdef LVDSCONTROLSOLUTION_EXPORTS
#define LVDSCONTROLSOLUTION_API __declspec(dllexport)
#else
#define LVDSCONTROLSOLUTION_API __declspec(dllimport)
#endif

// Include package used by dll
#include <iostream>
#include <string>



// Class definition inside of header namespace
namespace core {
	class AnokiClass {
	public:

		virtual void Destroy() {
			delete this;
		}

		virtual std::string Say() = 0;
		virtual double calculator(const double a) = 0;
	};
}

class LVDSCONTROLSOLUTION_API AnokiPotato {
public:
	// Things happen here
	
};


class LVDSCONTROLSOLUTION_API MarvinClass {
public:
	void Addition();
	// more things happen here
};


extern "C" LVDSCONTROLSOLUTION_API void randomtest();
extern "C" LVDSCONTROLSOLUTION_API unsigned int returnTest(const unsigned int kappa);