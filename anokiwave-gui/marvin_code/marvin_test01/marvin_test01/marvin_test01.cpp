// marvin_test01.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <Windows.h>
#include "..\..\GTDIO.h"

void CheckStatus(SHORT nStatus) {
    CHAR errorString[512];
    if (!nStatus) return;
    DioGetErrorString(nStatus, errorString, sizeof errorString);
    std::cout << errorString;
    std::cout << "Aborting the program...";
    return;
}

int main() {
    SHORT nSlotNum;
    SHORT nDensity;
    SHORT nBanks;
    SHORT nHandle;
    SHORT nStatus;

    nSlotNum = 0;

    DioSetupInitialization(0, 1, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
    CheckStatus(nStatus);

    std::cout << "Hello World!\n";

}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
