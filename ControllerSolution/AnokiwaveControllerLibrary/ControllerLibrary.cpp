#include "pch.h"
#include "ControllerLibrary.h"

#include "src/AnokiSequence.h"
#include "src/MarvinInterface.h"

static double* angles;
static char* commandBitSequence;
static unsigned long commandBitLength;

MarvinInterface _instance_Marvin;
AnokiSequence _instance_Anoki;

void CMD_ConnectToMarvinCard( ){
	_instance_Marvin.InitializeMarvinCard(0x103, (unsigned long)100e6);

}

bool CMD_LoadPointingAngles(char* outputFileName, float freq, float dwell) {
	_instance_Anoki.LoadAnglePoints(outputFileName, true);

	_instance_Anoki.setDwellTime(freq, dwell);

	_instance_Anoki.GenerateCommandSequence();

	return true;
}

void CMD_GetCommandBitSequence(unsigned char** commandBitSequence, unsigned long* commandBitLength) {
	_instance_Anoki.GetCommandSequence(commandBitSequence, commandBitLength);
}

bool CMD_outputCommandBitSequence(char* outputFileName) {

	_instance_Anoki.ExportCommandSequence(outputFileName);

	return true;
}

void CMD_LoadMarvinCard() {
	_instance_Marvin.LoadBinaryMemoryToCard(commandBitSequence, commandBitLength);
}

void CMD_RunMarvinCard() {
	_instance_Marvin.RunFromStep(0);
}