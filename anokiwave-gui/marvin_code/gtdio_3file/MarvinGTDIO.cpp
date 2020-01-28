
#include "MarvinGTDIO.h"

#include <Windows.h>
#include "GTDIO.h"

SHORT nHandle;

void SetupCard() {
	SHORT nSlotNum = 0x105;
	SHORT nHandle, nDensity, nBanks, nStatus;
	DioSetupInitialization(0, 1, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
}