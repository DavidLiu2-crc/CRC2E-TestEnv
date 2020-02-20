// AnokiLibrary.h : Declares the Anokiwave command functions for the DLL
#pragma once

#ifdef ANOKILIBRARY_EXPORTS
#define ANOKILIBRARY_API __declspec(dllexport)
#else
#define ANOKILIBRARY_API __declspec(dllimport)
#endif

class AnokiLibrary {
	
public:



	void read_fromCSV();

	void generateASCIISequence();
	unsigned int* getASCIISequence();

	void showNumSteps();

private:
	
	void cmd_SteerCommands();
	
	void add_currentCall();

	void cmd_StartBeam();

	void cmd_EndBeam();




};