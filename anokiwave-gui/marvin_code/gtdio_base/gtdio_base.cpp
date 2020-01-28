// gtdio_base.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

#include <Windows.h>
#include "GTDIO.h"


int main()
{
    SHORT nSlotNum = 0x105;
    SHORT nDensity, nBanks, nHandle, nStatus;

    DioSetupInitialization(0,1, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);

}
