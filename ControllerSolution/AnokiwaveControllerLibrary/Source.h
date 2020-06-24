#pragma once

#include <iostream>
#include <string>
#include <vector>

// User-defined _instance_Anokiwave API class
#include "src\AnokiAPI.h"
//#include "data\include\_instance_AnokiCommand.h"
//#include "data\include\_instance_AnokiObj.h"

// User-defined _instance_Marvin API class
#include "src\MarvinAPI.h"

// User-defined VISA API class
#include "src\VisaAPI.h"

// User-defined FFT Data processing API class
//#include "src\dataProcessingAPI.h"

// User-defined FFT Data processing class
//#include "data\include\fftAPI.h"

int main(int argc, char* argv[]);

// --- General user input correction function definition ---
void getUserInputString();
void getUserInputFloat();
void getUserInputNumber();

void printFrequency(unsigned long _nFreq);

