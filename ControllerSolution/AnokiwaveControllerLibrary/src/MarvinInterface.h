#pragma once

#include <Windows.h>
#include "../deps/GTDIO.h"

#include <iostream>
#include <fstream>

class MarvinInterface
{
public:
	/// <summary>
	/// Initialize the handle connection to Marvin card connected at slot number
	/// </summary>
	/// <param name="nSlotNumber"></param>
	/// <param name="nBoardFrequency"></param>
	void InitializeMarvinCard(SHORT nSlotNumber, DWORD nBoardFrequency);

	/// <summary>
	/// Copies the content of a binary file directly to marvin card memory
	/// </summary>
	/// <param name="nBinaryFileName"></param>
	void LoadBinaryMemoryToCard(std::string nBinaryFileName);

	/// <summary>
	/// Copies the content of a memory pointer to marvin card memory
	/// </summary>
	/// <param name="cmdPtr">char pointer 32-bit address location</param>
	/// <param name="len">char array length</param>
	void LoadBinaryMemoryToCard(char* cmdPtr, unsigned long len);

	/// <summary>
	/// Copies the memory from Marvin Card onto local machine memory
	/// </summary>
	/// <param name="memptr"></param>
	/// <param name="size"></param>
	void ReadMemoryFromCard(char* memptr, unsigned long size);

	/// <summary>
	/// Sets to Marvin card to run from the specified step
	/// </summary>
	/// <param name="step"></param>
	void RunFromStep(unsigned long step);

private:
	SHORT nHandle = 0;

	/// <summary>
	/// Prints the error code 
	/// </summary>
	/// <param name="pnStatus"></param>
	void CheckStatus(SHORT* pnStatus);

	/// <summary>
	/// private caller to load memory pointer into marvin card
	/// </summary>
	/// <param name="ptrCmd"></param>
	/// <param name="length"></param>
	void LoadMemory(char* ptrCmd, unsigned long length);

};

