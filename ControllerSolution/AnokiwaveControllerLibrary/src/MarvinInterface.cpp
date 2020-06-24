#include "MarvinInterface.h"




void MarvinInterface::InitializeMarvinCard(SHORT nSlotNumber, DWORD nBoardFrequency) {
	SHORT nStatus = 0;

	// --- Initialize and return the board handle of the connected card ---------------------------
	SHORT Master = 0;
	SHORT BoardNum = 1;
	SHORT nDensity = 0;
	SHORT nBanks = 0;
	
	DioSetupInitialization(Master, BoardNum, nSlotNumber, &nDensity, &nBanks, &nHandle, &nStatus);
	CheckStatus(&nStatus);

	// Set up the states of the marvin card
	DioSetupOutputState(nHandle, OUTPUTS_ENABLED, &nStatus);
	CheckStatus(&nStatus);

	DioSetupChannelsOutputStates(nHandle, 0xFFFFFFFF, &nStatus);
	CheckStatus(&nStatus);

	SHORT nWidth = 2; // 0:32-bit, 1:16-bit, 2:8-bit, 3:4-bit 
	DioSetupIOConfiguration(nHandle, nWidth, NULL, &nStatus);
	CheckStatus(&nStatus);

	SHORT nInterfaceType = 1; // 0:TTL, 1:LVDS
	DioSetupInputInterface(nHandle, nInterfaceType, &nStatus);
	CheckStatus(&nStatus);

	DioDomainSetupOperatingMode(nHandle, 0, &nStatus);
	CheckStatus(&nStatus);

	DioSetupFrequency(nHandle, nBoardFrequency, &nStatus);
	CheckStatus(&nStatus);

	// Set up the trigger states
	DioSetupSignalEdgeOrLevelMode(nHandle, DIO_EXTERNAL_TRIGGER, DIO_SIGNAL_ACTIVE_RISING_EDGE, &nStatus);
	CheckStatus(&nStatus);

	std::cout << "[MarvinInterface] Initialize Marvin card: " << nSlotNumber << "slot.\n";
}

void MarvinInterface::LoadBinaryMemoryToCard(std::string nBinaryFileName) {

	std::ifstream binFile;
	std::string line = "";

	binFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);

	try {
		binFile.open(nBinaryFileName, std::ios::in | std::ios::binary);
	}
	catch (std::ifstream::failure& e) { // Could not read file
		std::cout << "Catch: " << e.what() << "\n";
	}

	std::streampos size;
	char* memblock;
	if (binFile.is_open()) {
		size = binFile.tellg();
		memblock = new char[size];

		binFile.seekg(0, std::ios::beg);
		binFile.read(memblock, size);

		binFile.close();
	}
	else {
		memblock = new char[0];
		size = 1;
	}
	std::cout << "[MarvinInterface] Read binary file " << nBinaryFileName << " of size " << size << " bytes.\n";

	LoadMemory(memblock, size);
	std::cout << "[MarvinInterface] Loaded " << size << "bytes to Marvin card memory.\n";
}

void MarvinInterface::LoadBinaryMemoryToCard(char* cmdPtr, unsigned long len) {
	LoadMemory(cmdPtr, len);
	std::cout << "[MarvinInterface] Loaded " << len << "bytes to Marvin card memory.\n";
}

void MarvinInterface::ReadMemoryFromCard(char* memptr, unsigned long size) {
	SHORT nStatus = 0;

	// Assume memptr has allocation space of length >= size
	DioReadInMemory(nHandle, memptr, 0, size, &nStatus);
	CheckStatus(&nStatus);

	char* szDIreadFile = new char[100];
	sprintf_s(szDIreadFile, 100, "outputMarvinMemory.DI");

	DioSaveFile(nHandle, szDIreadFile, 0, &size, &nStatus);
	CheckStatus(&nStatus);
}

void MarvinInterface::RunFromStep(unsigned long step) {
	SHORT nStatus = 0;

	DioHalt(nHandle, &nStatus);
	CheckStatus(&nStatus);

	DioWriteProgramCounter(nHandle, step, &nStatus);
	CheckStatus(&nStatus);

	DioTrig(nHandle, &nStatus);
	CheckStatus(&nStatus);
}

void MarvinInterface::CheckStatus(SHORT* pnStatus) {
	// Check if nStatus = 0:success
	if (!*pnStatus) return;

	// Create the temporary Error Char String
	CHAR* szError = new char[512];

	DioGetErrorString(*pnStatus, szError, sizeof(szError) + 512); // Display the error message
	std::cout << "Error Code: " << pnStatus << "\t";
	std::cout << szError << "\n";

	delete[] szError;

}

void MarvinInterface::LoadMemory(char* ptrCmd, unsigned long length) {
	SHORT nStatus = 0;
	if (nHandle != 0) {
		DioWriteCtrlCommand(nHandle, 0, DIO_COMMAND_PAUSE, 0, 0, 0, 0, &nStatus);
		CheckStatus(&nStatus);

		DioWriteOutMemory(nHandle, ptrCmd, 0, length, &nStatus);
		CheckStatus(&nStatus);

		DioWriteCtrlCommand(nHandle, (DWORD)length - 1, DIO_COMMAND_CONTINUOUS_LOOP, 0, 0, 0, 0, &nStatus);
		CheckStatus(&nStatus);
	}
}