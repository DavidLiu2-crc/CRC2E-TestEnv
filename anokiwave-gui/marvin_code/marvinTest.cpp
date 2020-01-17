// include libraries
#include <iostream>
#include "GTDIO.h"

void CheckStatus(SHORT nStatus) {
  CHAR sz[512];
  if (!nStatus) return;
  DioGetErrorString(nStatus, sz, sizeof sz);
  std::cout << sz;
  std::cout << "Aborting the program...";
  return;
}

int main() {
  SHORT nSlotNum;
  SHORT nStatus;
  SHORT nHandle;
  SHORT nDensity;
  SHORT nBanks;

  DioSetupInitialization(0, 1, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
  CheckStatus(nStatus);


  std::cout << "Hello World!\n" ;
  return 0;
}
