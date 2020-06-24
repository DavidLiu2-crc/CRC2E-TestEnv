// AnokiwaveControllerClient.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

#include "../AnokiwaveControllerLibrary/ControllerLibrary.h"

int main()
{
	char* csvInputFile = new char[100];
	sprintf_s(csvInputFile, 100, "anglePoint.csv");

	CMD_LoadPointingAngles(csvInputFile, (float)100e6, (float)25e-6);

	unsigned char* commandPtr;
	unsigned long commandLength;

	CMD_GetCommandBitSequence(&commandPtr, &commandLength);

	CMD_outputCommandBitSequence((char*) "angleSequence");

	CMD_ConnectToMarvinCard();

	CMD_LoadMarvinCard();

}