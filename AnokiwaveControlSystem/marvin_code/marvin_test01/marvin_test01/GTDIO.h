/****************************************************************************
*
* FILE     : GTDIO.H
* PURPOSE  : Exported Function Prototypes for GTDIO32.DLL
* VERSION  : 5.1
* CREATED  : 1993
* BY       : Ron Yazma, Tamir Bard
*            Copyright 1995-2019, Marvin Test Solutions, Inc.
*
* COMMENTS:  To use the GTDIO driver within C/C++ programs:
*
*			* Include this file "gtdio.h" in your source file
*			1. Include <windows.h> before including this file
*			2. Add GTDIO32.LIB import library when linking
*			3. Make sure the GTDIO32.DLL is in your path
*
****************************************************************************/
#ifndef __GTDIO_H__
#define __GTDIO_H__

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

typedef char                    CHAR;
typedef unsigned char           BYTE;
typedef short 					SHORT;
typedef unsigned short          WORD;
typedef int						INT;
typedef unsigned int			UINT;
#ifdef _LP64
typedef int					    LONG;
typedef unsigned int            DWORD;
#else
typedef long					LONG;
typedef unsigned long           DWORD;
#endif  // _LP64
typedef unsigned long long		DDWORD;
typedef double					DOUBLE;
typedef int                     BOOL;
typedef BOOL *					PBOOL;
typedef SHORT *					PSHORT;
typedef WORD *					PWORD;
typedef LONG *					PLONG;
typedef DWORD *					PDWORD;
typedef DDWORD *				PDDWORD;
typedef DOUBLE *				PDOUBLE;
#ifndef VOID
#define VOID                    void
#endif
typedef void *                  PVOID;
typedef CHAR *                  PSTR;
typedef BYTE *                  PBYTE;

#ifndef WINAPI
#ifdef __GNUC__
#define WINAPI
#define CONST					const
typedef CHAR*					LPSTR;
typedef CONST CHAR*				LPCSTR;
typedef void*					HANDLE;
#else
#define WINAPI                  __stdcall
#endif
typedef void 					* HWND;
#ifdef _MSC_VER
typedef __nullterminated const CHAR *  PCSTR;
#else
typedef const CHAR *  PCSTR;
#endif
#endif	// WINAPI

#ifdef __cplusplus
extern "C" {
#endif

// 	Constants and Statics

// Compare file mode
#define DIO_COMPARE_DIO_DIO						0
#define DIO_COMPARE_DIO_DI						1
#define DIO_COMPARE_DI_DIO						2
#define DIO_COMPARE_DI_DI						3

// Board Types
#define DIO_BOARD_TYPE_INVALID					0x00
#define DIO_BOARD_TYPE_GT2550					0x01
#define DIO_BOARD_TYPE_GT5150					0x10
#define DIO_BOARD_TYPE_GX5150					0x20
#define DIO_BOARD_TYPE_GX5105					0x22
#define DIO_BOARD_TYPE_GX5106					0x23
#define DIO_BOARD_TYPE_GC5050					0x30
#define DIO_BOARD_TYPE_GX5152					0x40
#define DIO_BOARD_TYPE_GX5050					0x50
#define DIO_BOARD_TYPE_GX5055					0x55
#define DIO_BOARD_TYPE_GX5280					0x60
#define DIO_BOARD_TYPE_GX5290					0x70
#define DIO_BOARD_TYPE_GX5290E					0x75
#define DIO_BOARD_TYPE_GX5295					0x7A

// I/O Modules types
#define IO_MODULE_GT5910_STANDARD_TTL			0x10
#define IO_MODULE_GT5920_FREQUENCY_DOUBLER		0x20
#define IO_MODULE_GT5930_LEVEL_SHIFTER			0x30
#define IO_MODULE_GT5940_PECL_TTL_TRANSLATION	0x40
#define IO_MODULE_GT5950_REAL_TIME_COMPARISON	0x50
#define IO_MODULE_GT5960_LVDS					0x60
#define IO_MODULE_GT5955						0x55
#define IO_MODULE_NOT_PRESENT					0xFF

// Max masters and salves
#define DIO_DOMAIN_MAX_BOARDS					32
#define DIO_MAX_SLAVES							31
#define DIO_MAX_MASTERS							31
#define DIO_MAX_CARRIER							8
#define DIO_MAX_BANKS							4
#define DIO_MAX_DENSITY							2

// Clock Strobe Source
#define CLK_STROBE_INTERNAL						0
#define CLK_EXTERNAL_STROBE_INTERNAL			1
#define CLK_PRG_EXTERNAL_STROBE_INTERNAL		2
#define CLK_STROBE_EXTERNAL						3
#define CLK_INTERNAL_STROBE_EXTERNAL			4

// External Clock/Strobe frequency
#define EXTERNAL_CLK_FREQUENCY					0
#define EXTERNAL_STROBE_FREQUENCY				1

// For fill memory
#define IN_ARRAY								0
#define OUT_ARRAY								1
#define DATA_ARRAY								2
#define CTRL_ARRAY								3
#define DIRECTION_ARRAY							4
#define VALID_DATA_ARRAY						5
#define RTC_EXPECTED_DATA_ARRAY					6
#define RTC_INPUT_MASKE_DATA_ARRAY				7

// GX5150 jump register
#define JUMP_REGISTER_A							0
#define JUMP_REGISTER_B							1

// GX5150 jump register output control
#define OUTPUTS_ENABLED							0
#define OUTPUTS_DISABLED						1
#define OUTPUTS_DISABLED_ON_HALT_OR_PAUSE		2
#define OUTPUTS_ZERO							3
#define OUTPUTS_ONE								4

// Memory fill constants
#define DIO_MEMFILL_ZERO						0
#define DIO_MEMFILL_RAMP						1
#define DIO_MEMFILL_CONTINUES_RAMP				2
#define DIO_MEMFILL_RANDOM						3
#define DIO_MEMFILL_CHECKER_BOARD				4
#define DIO_MEMFILL_ONE							5

// Self Test modes
#define TEST_MEMORY								0
#define TEST_REGISTERS							1
#define TEST_ALL								2

// Trigger mode
#define EXT_DISABLE								0
#define TRIG_MODE_D								1
#define TRIG_MODE_T								2
#define TRIG_MODE_DT							3
#define TRIG_MODE_TD							4

// External Event source
#define EXT_EVENT_EXTERNAL						0
#define EXT_EVENT_XREG							1

// Signal Edge
#define DIO_RISING_EDGE							0
#define DIO_FALLING_EDGE						1

// PAUSE count (GX5150 only)
#define PAUSE_COUNT_DISABLE						0
#define PAUSE_COUNT_ENABLE						1
#define PAUSE_COUNT_RST_ON_PAUSE				2

// Board Direction (GX5150/GX5152/GX5050/GX5055)
#define BOARD_DIRECTION_INPUT					0
#define BOARD_DIRECTION_OUTPUT					1

// Board Direction (GX529x)
#define BOARD_GX529X_DIRECTION_INPUT			1
#define BOARD_GX529X_DIRECTION_OUTPUT			0

// Board Direction (GX528x)
#define BOARD_GX528X_DIRECTION_INPUT			1
#define BOARD_GX528X_DIRECTION_OUTPUT			0

// Select Delay clocks
#define CLK_DELAY								0
#define USER_CLK_DELAY							1
#define STROBE_DELAY							2
#define BOARD_OFFSET_DELAY						3

// Clock/ Strobe 
#define DIO_INTERNAL_CLOCK						0
#define DIO_INTERNAL_STROBE						1

// Compare Data type
#define COMPARE_DATA_BYTE						0
#define COMPARE_DATA_WORD						1
#define COMPARE_DATA_DWORD						2

// Register File Counter
#define SEQUENCER_REGISTER_A					0
#define SEQUENCER_REGISTER_B					1
#define SEQUENCER_REGISTER_C					2

//Channel list mode options
#define DIO_CH_LIST_MODE_ARRAY_OF_CHANNELS		0
#define DIO_CH_LIST_MODE_ALL_BOARD_CHANNELS		1
#define DIO_CH_LIST_MODE_ALL_DOMAIN_CHANNELS	2
#define DIO_CH_LIST_MODE_RANGE_OF_CHANNELS		3

//Channel Output data format
#define DIO_OUTPUT_DATA_FORMAT_NR				0
#define DIO_OUTPUT_DATA_FORMAT_R0				1
#define DIO_OUTPUT_DATA_FORMAT_R1				2
#define DIO_OUTPUT_DATA_FORMAT_RZ				3
#define DIO_OUTPUT_DATA_FORMAT_RC				4

// DIOPanel() constants - nMode for panel functions
#define GTDIO_PANEL_MODELESS					0
#define GTDIO_PANEL_MODAL						1	

//////////////////////////////////////////////////////////////////////////////
// Forward Declarations - Exported API
//////////////////////////////////////////////////////////////////////////////
// Initialization functions
void WINAPI DioInitialize(SHORT nMaster, PSHORT pnHandle, PSHORT pnStatus);
void WINAPI DioSetupInitialization(SHORT nMaster, SHORT nBrdNum, WORD wBase, PSHORT pnDensity, PSHORT pnBanks, PSHORT pnHandle, PSHORT pnStatus);
void WINAPI DioSetupInitializationVisa(SHORT nMaster, SHORT nBrdNum, LPCSTR szVisaResource, PSHORT pnDensity, PSHORT pnBanks, PSHORT pnHandle, PSHORT pnStatus);
// Save the domain configuration to the GtDio.ini file to be used by DioInitialize.
void WINAPI DioSaveDomainConfiguration(SHORT nHandle, PSHORT pnStatus);

void WINAPI DioPanel(HWND hwndParent, SHORT nMode, HWND * phwndPanel);
// DioPanelEx allow to open the panel initialized when passing the board handle
void WINAPI DioPanelEx(PSHORT pnHandle, HWND hwndParent, SHORT nMode, HWND * phwndPanel, PSHORT pnStatus);

// General Information functions
void WINAPI DioGetBoardSummary(SHORT nHandle, LPSTR pszBoardSum, SHORT nSumMaxLen, PSHORT pnStatus);
void WINAPI DioGetDriverSummary (PSTR pszSummary, SHORT nCount, PDWORD pdwVersion);
void WINAPI DioGetErrorString(SHORT nError, PSTR pszError, SHORT nCount);
void WINAPI DioGetSlaveHandle(SHORT nMasterHandle, SHORT nBrdNum, PSHORT pnHandle, PSHORT pnStatus);
void WINAPI DioGetBoardType (SHORT nHandle, PSHORT pnBoardType, PSHORT pnStatus);
void WINAPI DioGetCalibrationInfo(SHORT nHandle, PSTR pszCalibrationInfo, SHORT nInfoMaxLen, PSHORT pnDaysUntilExpire, PSHORT pnStatus);

// Set commands
void WINAPI DioSetupBClkFrequency(SHORT nMasterHandle, DWORD dwFrequency, PSHORT pnStatus);
void WINAPI DioSetupClkStrobeDelay(SHORT nMasterHandle, SHORT nClock, DOUBLE dDelay, PSHORT pnStatus);
void WINAPI DioSetupClkStrobeSource(SHORT nMasterHandle, SHORT nSource, PSHORT pnStatus);
void WINAPI DioSetupCounterOverflowMode (SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetupExternalRefClkFrequency(SHORT nMasterHandle, SHORT nClock, DWORD dwExtRefFrequency, PSHORT pnStatus);
void WINAPI DioSetupFrequency(SHORT nMasterHandle, DWORD dwFrequency, PSHORT pnStatus);
void WINAPI DioSetupGroupsStaticModeOutputState(SHORT nHandle, SHORT nState, PSHORT pnStatus);
void WINAPI DioSetupIOConfiguration (SHORT nHandle, SHORT nWidth, SHORT nDirection, PSHORT pnStatus);
void WINAPI DioSetJumpAddress(SHORT nMasterHandle, SHORT nRegister, DWORD dwJumpAddress, PSHORT pnStatus);
void WINAPI DioSetupExternalJumpATriggerMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetupExternalPauseAndTriggerMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetupOutputState (SHORT nHandle, SHORT nOutputState, PSHORT pnStatus);
void WINAPI DioSetPauseCounterMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetPauseCount(SHORT nMasterHandle, DWORD dwCount, PSHORT pnStatus);
void WINAPI DioSetupSequencerMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetupStrobeTiming(SHORT nMasterHandle, SHORT nTime, PSHORT pnStatus);
void WINAPI DioSetupTriggerMode(SHORT nMaster, SHORT nMode, PSHORT pnStatus);
void WINAPI DioSetupTriggerDEvent(SHORT nMaster, WORD wEvent, WORD wMask, PSHORT pnStatus);
void WINAPI DioSetupTriggerPEvent(SHORT nMaster, WORD wEvent, WORD wMask, PSHORT pnStatus);
void WINAPI DioSetupTriggerTEvent(SHORT nMaster, WORD wEvent, WORD wMask, PSHORT pnStatus);
void WINAPI DioSetupTriggerXEventSource(SHORT nMasterHandle, SHORT nSource, PSHORT pnStatus);

// Get functions
void WINAPI DioGetBClkFrequency(SHORT nMasterHandle, PDWORD pdwFrequency, PSHORT pnStatus);
void WINAPI DioGetClkStrobeDelay(SHORT nMasterHandle, SHORT nClock, PDOUBLE pdDelay, PSHORT pnStatus);
void WINAPI DioGetClkStrobeSource(SHORT nMasterHandle, PSHORT pnSource, PSHORT pnStatus);
void WINAPI DioGetCounterOverflowMode (SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetExternalInputsStates(SHORT nMasterHandle, PDWORD pdwInputsStates, PSHORT pnStatus);
void WINAPI DioGetExternalJumpATriggerMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetExternalPauseAndTriggerMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetExternalRefClkFrequency(SHORT nMasterHandle, SHORT nClock, PDWORD pdwExtRefFrequency, PSHORT pnStatus);
void WINAPI DioGetFrequency(SHORT nMasterHandle, PDWORD pdwFrequency, PSHORT pnStatus);
void WINAPI DioGetGroupsStaticModeOutputState(SHORT nHandle, PSHORT pnState, PSHORT pnStatus);
void WINAPI DioGetIOConfiguration (SHORT nHandle, PSHORT pnWidth, PSHORT pnDirection, PSHORT pnStatus);
void WINAPI DioGetJumpAddress(SHORT nMasterHandle, SHORT nRegister, PDWORD pdwJumpAddress, PSHORT pnStatus);
void WINAPI DioGetMemoryBankSize(SHORT nHandle, SHORT nBank, PSHORT pnDensity, PSHORT pnStatus);
void WINAPI DioGetNumberOfSteps(SHORT nHandle, PDWORD pdwSteps, PSHORT pnStatus);
void WINAPI DioGetOutputState(SHORT nHandle, PSHORT pnOutputState, PSHORT pnStatus);
void WINAPI DioGetPauseCounterMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetPauseCount(SHORT nMasterHandle, PDWORD pdwCount, PSHORT pnStatus);
void WINAPI DioGetSequencerMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetStepCounter(SHORT nMasterHandle, PDWORD pdwStepCounter, PSHORT pnStatus);
void WINAPI DioGetStrobeTiming(SHORT nMasterHandle, PSHORT pnDelay, PSHORT pnStatus);
void WINAPI DioGetTriggerMode(SHORT nMaster, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioGetTriggerDEvent(SHORT nMasterHandle, PWORD pwEvent, PWORD pwMask, PSHORT pnStatus);
void WINAPI DioGetTriggerPEvent(SHORT nMasterHandle, PWORD pwEvent, PWORD pwMask, PSHORT pnStatus);
void WINAPI DioGetTriggerTEvent(SHORT nMasterHandle, PWORD pwEvent, PWORD pwMask, PSHORT pnStatus);
void WINAPI DioGetTriggerXEventSource(SHORT nMasterHandle, PSHORT pnSource, PSHORT pnStatus);

// Flow-control functions
void WINAPI DioArm(SHORT nMasterHandle, PSHORT pnStatus);
void WINAPI DioHalt(SHORT nMasterHandle, PSHORT pnStatus);
void WINAPI DioPause(SHORT nMasterHandle, PSHORT pnStatus);
void WINAPI DioReset(SHORT nMaster, PSHORT pnStatus);
void WINAPI DioStep(SHORT nMasterHandle, DWORD dwSteps, PSHORT pnStatus);
void WINAPI DioTrig(SHORT nMasterHandle, PSHORT pnStatus);

// Control Memory Read/Write
void WINAPI DioReadCtrlMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteCtrlMemory(SHORT nHandle, PVOID pVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Direction Memory Read/Write
void WINAPI DioReadDirectionMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteDirectionMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// In Memory Read/Write
void WINAPI DioReadInMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteInMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// I/O Memory Read/Write
void WINAPI DioReadIOMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteIOMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Out Memory Read/Write
void WINAPI DioReadOutMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteOutMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Valid Data Memory Read/Write
void WINAPI DioReadValidDataMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioWriteValidDataMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Program Counter Read/Write
void WINAPI DioReadProgramCounter(SHORT nMasterHandle, PDWORD pdwCounter, PSHORT pnStatus);
void WINAPI DioWriteProgramCounter(SHORT nMasterHandle, DWORD dwCounter, PSHORT pnStatus);

// I/O Pins Read/Write
void WINAPI DioReadIOPinsValue(SHORT nHandle, PDWORD pdwValue, PSHORT pnStatus);
void WINAPI DioWriteIOPinsValue(SHORT nHandle, DWORD dwValue, PSHORT pnStatus);

// Sequencer Register (Gc5050/Gx5050)
void WINAPI DioReadSequencerRegister(SHORT nMasterHandle, SHORT nRegister, PSHORT pnValue, PSHORT pnStatus);

//**********************************************************************************
// DIO Remapping/editing channel's Data
//**********************************************************************************
// Remap Channel Mode
#define	DIO_SWAP_CHANNELS						1
#define	DIO_MOVE_CHANNELS						2
#define	DIO_COPY_CHANNELS						3

// Remap Channel target Memory 
#define DIO_REMAP_MEMORY_AUTO					0
#define DIO_REMAP_IN_MEMORY						1
#define DIO_REMAP_OUT_MEMORY					2
#define DIO_REMAP_DATA_MEMORY					4
#define DIO_REMAP_CTRL_MEMORY					8
#define DIO_REMAP_DIRECTION_MEMORY				0x10
#define DIO_REMAP_RTC_EXPECTED_MEMORY			0x20
#define DIO_REMAP_RTC_INPUT_MASK_MEMORY			0x40

void WINAPI DioRemapChannel(SHORT nHandle, SHORT nFirstChannel, SHORT nSecondChannel, SHORT nMode, DWORD dwMemory, DWORD dwStartStep, PDWORD pdwNumSteps, DWORD dwOptions, PSHORT pnStatus);

//**********************************************************************************
// Dio Command set
//**********************************************************************************
// Commands	
#define DIO_COMMAND_NONE					0
#define DIO_COMMAND_JUMP_FAR				1
#define DIO_COMMAND_JUMP_NEAR				2
#define DIO_COMMAND_LOOP					3
#define DIO_COMMAND_SET						4
#define DIO_COMMAND_CALL					5
#define DIO_COMMAND_RETURN					6
#define DIO_COMMAND_PAUSE					7
#define DIO_COMMAND_HALT					8
#define DIO_COMMAND_JUMP_A					9
#define DIO_COMMAND_JUMP_B					10
#define DIO_COMMAND_CONTINUOUS_LOOP			11
#define DIO_COMMAND_CLEAR_ALL				1000

// Control Register / External Event Line number
#define DIO_CONTROL_NONE					0
#define DIO_CONTROL_REGISTER_A				1
#define DIO_CONTROL_REGISTER_B				2
#define DIO_CONTROL_REGISTER_C				3
#define DIO_CONTROL_REGISTER_D				4
#define DIO_CONTROL_EXT_EVENT_LINE_0		10
#define DIO_CONTROL_EXT_EVENT_LINE_1		11
#define DIO_CONTROL_EXT_EVENT_LINE_2		12
#define DIO_CONTROL_EXT_EVENT_LINE_3		13

// Condition
#define DIO_CONDITION_NONE									0
#define DIO_CONDITION_EXT_EVENTS_BIGGER_THEN_REGISTER_VAL	1
#define DIO_CONDITION_EXT_EVENTS_SMALLER_THEN_REGISTER_VAL	2
#define DIO_CONDITION_EXT_EVENTS_EQUAL_REGISTER_VAL			3
#define DIO_CONDITION_EXT_EVENTS_NOT_EQUAL_REGISTER_VAL		4
#define DIO_CONDITION_EXT_EVENT_LINE_LOW					5
#define DIO_CONDITION_EXT_EVENT_LINE_HIGH					6

// Control fields: | Step Number | Command | Control | Condition | Direction | Output Enable |
void WINAPI DioWriteCtrlCommand(SHORT nHandle, DWORD dwStep, SHORT nOpCode, DWORD dwParam1, DWORD dwParam2, DWORD dwParam3, DWORD dwParam4, PSHORT pnStatus);
void WINAPI DioReadCtrlCommand(SHORT nHandle, DWORD dwStep, PSHORT pnOpCode, PDWORD pdwParam1, PDWORD pdwParam2, PDWORD pdwParam3, PDWORD pdwParam4, PSHORT pnStatus);
void WINAPI DioGetNextCtrlCommandStep(SHORT nHandle, PDWORD pdwStep, PSHORT pnStatus);

// Memory fill/test
void WINAPI DioCompareData(PVOID pvBuffer1, PVOID pvBuffer2, PDWORD pdwStep1,PDWORD pdwStep2, PVOID pvData1, PVOID pvData2, DWORD dwSize, DWORD dwMask, SHORT nDataType, PSHORT pnStatus);
void WINAPI DioCompareDataWithMaskArray(PVOID pvBuffer1, PVOID pvBuffer2, PDWORD pdwStep1, PDWORD pdwStep2, PVOID pvData1, PVOID pvData2, DWORD dwSize, PVOID pvMaskBuffer, PDWORD pdwMaskStep, SHORT nDataType, PSHORT pnStatus);
void WINAPI DioMemoryFill(SHORT nHandle, SHORT nPattern, SHORT nMemorySource, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioSelfTest (SHORT nHandle, SHORT nTestMode, PDWORD pdwFailedStepNum, PSHORT pnStatus);

// Helper functions - packing and unpacking data, either to/from single DWORD or to/from arrays
void WINAPI DioDataPack(SHORT nNumPins, SHORT nDataSize, SHORT nDataOffset, SHORT nUnpackedDataType, PDWORD pdwPackedData, PVOID pvUnpackedData, PSHORT pnStatus);
void WINAPI DioDataUnpack(SHORT nNumPins, SHORT nDataSize, SHORT nDataOffset, SHORT nUnpackedDataType, DWORD dwPackedData, PVOID pvUnpackedData, PSHORT pnStatus);

// Register functions
void WINAPI DioReadStatusRegister(SHORT nHandle, PWORD pwData, PSHORT pnStatus);
void WINAPI DioReadXRegister(SHORT nMasterHandle, PWORD pwData, PSHORT pnStatus);
void WINAPI DioWriteXRegister(SHORT nMasterHandle, WORD wData, PSHORT pnStatus);

//**********************************************************************************
//	GX5055/GX5280/GX5290/GX5290e Specific functions
//**********************************************************************************
// Enable/Disable Channels Outputs
void WINAPI DioGetChannelsOutputStates(SHORT nHandle, PDWORD pdwStates, PSHORT pnStatus);
void WINAPI DioSetupChannelsOutputStates(SHORT nHandle, DWORD dwStates, PSHORT pnStatus);

//**********************************************************************************
//	GX5280/GX5290/GX5295/GX5290e Specific functions
//**********************************************************************************
// Voltage standards
#define DIO_IO_DATA_INTERFACE_VOLTAGE_2_5V				0
#define DIO_IO_DATA_INTERFACE_VOLTAGE_3_3V				1
#define DIO_IO_DATA_INTERFACE_VOLTAGE_1_8V				2
#define DIO_IO_DATA_INTERFACE_VOLTAGE_1_5V				3

// Burst min/max
#define DIO_MIN_BURST_STEPS								1
#define DIO_MAX_BURST_STEPS								1048576
													
// I/O Interface									
#define DIO_IO_INTERFACE_TTL							0
#define DIO_IO_INTERFACE_LVDS							1
													
// I/O Interface Voltage Level						
#define DIO_INTERFACE_MIN_VOLTAGE						1.4
#define DIO_INTERFACE_MAX_VOLTAGE						3.6

// Interface Standard Level
#define DIO_INTERFACE_STANDARD_TWO_POINT_FIVE_VOLTS		0
#define DIO_INTERFACE_STANDARD_THREE_POINT_THREE_VOLTS	1
#define DIO_INTERFACE_STANDARD_ONE_POINT_EIGHT_VOLTS	2
#define DIO_INTERFACE_STANDARD_ONE_POINT_FIVE_VOLTS		3

// PXI Trigger Bus Line
#define DIO_PXI_TRIGGER_BUS_LINE0						0
#define DIO_PXI_TRIGGER_BUS_LINE1						1
#define DIO_PXI_TRIGGER_BUS_LINE2						2
#define DIO_PXI_TRIGGER_BUS_LINE3						3
#define DIO_PXI_TRIGGER_BUS_LINE4						4
#define DIO_PXI_TRIGGER_BUS_LINE5						5
#define DIO_PXI_TRIGGER_BUS_LINE6						6
#define DIO_PXI_TRIGGER_BUS_LINE7						7

// PXI Trigger Bus Line mode settings
#define DIO_PXI_TRIGGER_BUS_LINE_MODE_DISABLE			0
#define DIO_PXI_TRIGGER_BUS_LINE_MODE_PAUSE_INPUT		1
#define DIO_PXI_TRIGGER_BUS_LINE_MODE_PAUSE_OUTPUT		2
#define DIO_PXI_TRIGGER_BUS_LINE_MODE_TRIGGER_INPUT		3
#define DIO_PXI_TRIGGER_BUS_LINE_MODE_TRIGGER_OUTPUT	4

// PXI Star Trigger Bus mode settings 
#define DIO_PXI_STAR_TRIGGER_DISABLED					0
#define DIO_PXI_STAR_TRIGGER_TO_PAUSE					1
#define DIO_PXI_STAR_TRIGGER_TO_TRIGGER					2

// Clock or Strobe External Gate Mode
#define DIO_CLK_STROBE_EXTERNAL_GATE_DISABLE			0
#define DIO_CLK_STROBE_EXTERNAL_GATE_ENABLE				1

// Timing/Control Signals
#define DIO_EXTERNAL_STROBE_ENABLE						0
#define DIO_EXTERNAL_CLOCK_ENABLE						1
#define DIO_EXTERNAL_PAUSE								2
#define DIO_EXTERNAL_TRIGGER							3
#define DIO_OUTPUT_RUN									4
#define DIO_OUTPUT_ARM									5
#define DIO_PXI_STAR_TRIGGER							6
#define DIO_PXI_TRIGGER_BUS								7

// Signal Edge or Level Modes
#define DIO_SIGNAL_ACTIVE_LOW							0
#define DIO_SIGNAL_ACTIVE_HIGH							1
#define DIO_SIGNAL_ACTIVE_RISING_EDGE					2
#define DIO_SIGNAL_ACTIVE_FALLING_EDGE					3

// Output clocks 
#define DIO_OUT_CLOCK									0
#define DIO_OUT_STROBE									1
#define DIO_OUT_B_CLOCK									2
#define DIO_OUT_LVDS_CLOCK								3
														
// Output clocks state
#define DIO_CLOCK_OUTPUT_DISABLE						0
#define DIO_CLOCK_OUTPUT_ENABLE							1

// Clock or Strobe External Gate Mode
void WINAPI DioSetupClkStrobeExternalGateMode(SHORT nHandle, SHORT nClkStrobe, SHORT nMode, PSHORT pnStatus);
void WINAPI DioGetClkStrobeExternalGateMode(SHORT nHandle, SHORT nClkStrobe, PSHORT pnMode, PSHORT pnStatus);

// Configure Interface Standard Level
void WINAPI DioConfigureInterfaceStandardLevel(SHORT nHandle, SHORT nStandardLevel, PSHORT pnStatus);
void WINAPI DioGetInterfaceStandardLevel(SHORT nHandle, PSHORT pnStandardLevel, PSHORT pnStatus);

// Output clocks state
void WINAPI DioSetupOutputClocksState(SHORT nHandle, SHORT nClock, SHORT nState, PSHORT pnStatus);
void WINAPI DioGetOutputClocksState(SHORT nHandle, SHORT nClock, PSHORT pnState, PSHORT pnStatus);

// Active Input Interface
void WINAPI DioSetupInputInterface(SHORT nHandle, SHORT nInterface, PSHORT pnStatus);
void WINAPI DioGetInputInterface(SHORT nHandle, PSHORT pnInterface, PSHORT pnStatus);

// Channels Voltage Level
void WINAPI DioSetupChannelsVoltageLevel(SHORT nHandle, DOUBLE dVoltage, PSHORT pnStatus);
void WINAPI DioGetChannelsVoltageLevel(SHORT nHandle, PDOUBLE pdVoltage, PSHORT pnStatus);

// Signal Edge or Level Mode
void WINAPI DioGetSignalEdgeOrLevelMode(SHORT nMasterHandle, SHORT nSignal, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioSetupSignalEdgeOrLevelMode(SHORT nMasterHandle, SHORT nSignal, SHORT nMode, PSHORT pnStatus);

// PXI Trigger Bus Line Mode
void WINAPI DioGetPxiTriggerBusLineMode(SHORT nMasterHandle, SHORT nLine, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioSetupPxiTriggerBusLineMode(SHORT nMasterHandle, SHORT nLine, SHORT nMode, PSHORT pnStatus);

// PXI Star Trigger Input Mode
void WINAPI DioGetPxiStarTriggerMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioSetupPxiStarTriggerMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);

//**********************************************************************************
// PXI Express (Gx529xe only)
//**********************************************************************************
// DIO PXI express trigger line assignments (nControl)
#define DIO_TRIGGER_BUS_RUN_CTRL									0   // use line as run trigger
#define DIO_TRIGGER_BUS_ARM_CTRL									1   // use line as arm trigger
#define DIO_TRIGGER_BUS_EXT_CLK_CTRL								2   // use line as external clock
#define DIO_TRIGGER_BUS_EXT_STROBE_CTRL								3   // use line as external strobe

// PXI Express control lines (Gx529xe only) to Trigger Bus Line (0-7)
void WINAPI DioGetControlToPxiTriggerBusLineMode(SHORT nMasterHandle, SHORT nControl, PSHORT pnLine, PBOOL pbEnable, PSHORT pnStatus);
void WINAPI DioSetupControlToPxiTriggerBusLineMode(SHORT nMasterHandle, SHORT nControl, SHORT nLine, BOOL bEnable, PSHORT pnStatus);

//**********************************************************************************
// Real Time compare (GX529x only)
//**********************************************************************************
// Stop condition (halt)
#define DIO_RTC_STOP_ON_FAILURES_COUNT				0   // halt after x failures
#define DIO_RTC_STOP_ON_FAILURES_COUNT_SAVE_DATA	1   // halt after x failures, save leading data to the last failure
#define DIO_RTC_STOP_ON_DATA_VALUE					2   // halt when data is same as specified
#define DIO_RTC_STOP_ON_PROGRAM_COUNTER				4   // halt when program counter is as specified

void WINAPI DioRealTimeCompareSetupStopCondition(SHORT nHandle, SHORT nCondition, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetStopCondition(SHORT nHandle, PSHORT pnCondition, PSHORT pnStatus);

// Real Time Compare condition value 
#define DIO_RTC_CONDITION_FAILURE_COUNT				0   // halt on x failures
#define DIO_RTC_CONDITION_DATA						1   // halt on specified input data
#define DIO_RTC_CONDITION_PROGRAM_COUNTER			2   // halt on specified program counter

void WINAPI DioRealTimeCompareSetupConditionValue(SHORT nHandle, SHORT nCondition, DWORD dwValue, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetConditionValue(SHORT nHandle, SHORT nCondition, PDWORD pdwValue, PSHORT pnStatus);

// Input Edge
void WINAPI DioRealTimeCompareSetupInputDataClockEdge(SHORT nHandle, SHORT nEdge, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetInputDataClockEdge(SHORT nHandle, PSHORT pnEdge, PSHORT pnStatus);

// Get Errors Count
void WINAPI DioRealTimeCompareGetFailureCount(SHORT nHandle, PDWORD pdwCount, PSHORT pnStatus);

// Real Time Comparison results data type
#define DIO_RTC_SAVE_COMPARED_DATA					0   // save error data only
#define DIO_RTC_SAVE_INPUT_DATA						1   // save leading and error data

void WINAPI DioRealTimeCompareSetupResultsDataType(SHORT nHandle, SHORT nDataType, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetResultsDataType(SHORT nHandle, PSHORT pnDataType, PSHORT pnStatus);

// Read results from real-time comparison memory 
void WINAPI DioRealTimeCompareClearResultMemory(SHORT nHandle, PSHORT pnStatus);
void WINAPI DioRealTimeCompareReadResults(SHORT nHandle, PDWORD pdwAddress, PVOID pvData, PBOOL pabComparedStatus, DWORD dwStart, PDWORD pdwSize, PSHORT pnStatus);

// Clock Cycles Delay Data type
#define DIO_RTC_EXPECTED_DATA						0   // delay expected data for comparison by clock cycles 
#define DIO_RTC_MASKED_DATA							1   // delay mask data for comparison by clock cycles

void WINAPI DioRealTimeCompareSetupDataDelay(SHORT nHandle, SHORT nDataType, DWORD dwCycles, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetDataDelay(SHORT nHandle, SHORT nDataType, PDWORD pdwCycles, PSHORT pnStatus);

// Expected Memory Read/Write (stored in output memory)
void WINAPI DioRealTimeCompareReadExpectedMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioRealTimeCompareWriteExpectedMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Mask Memory Read/Write (stored in input memory)
void WINAPI DioRealTimeCompareReadMaskMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioRealTimeCompareWriteMaskMemory(SHORT nHandle, PVOID pvVector, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);

// Real Time Compare modes
#define DIO_RTC_MODE_DEFAULT					0
#define DIO_RTC_MODE_FIRST_FAIL_PER_CHANNEL		1

void WINAPI DioRealTimeCompareSetupMode(SHORT nHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetMode(SHORT nHandle, PSHORT pnMode, PSHORT pnStatus);

//**********************************************************************************
// API to be used when Operating Mode is set to DIO_RTC_MODE_FIRST_FAIL_PER_CHANNEL
//**********************************************************************************
// Sets the Real Time Compare Active Channels, each bit represents a board channel, Bit Hi=Active 
void WINAPI DioRealTimeCompareSetupActiveChannels(SHORT nHandle, DWORD dwActiveChannels, PSHORT pnStatus);
void WINAPI DioRealTimeCompareGetActiveChannels(SHORT nHandle, PDWORD pdwActiveChannels, PSHORT pnStatus);

// Clear all Channels' Status
void WINAPI DioRealTimeCompareClearChannelsStatus(SHORT nHandle,  PSHORT pnStatus);

// Reads the board's Real Time Compare channels' status, Bit Hi=specified channel failed comparison.
void WINAPI DioRealTimeCompareReadChannelsStatus(SHORT nHandle, PDWORD pdwChannelsStatus, PSHORT pnStatus);

// Returns domain wide real time compare pass/fail status
void WINAPI DioRealTimeCompareGetDomainFailStatus(SHORT nHandle, PBOOL pbFailStatus, PSHORT pnStatus);

//**********************************************************************************
//	GX5055/Gx5295 (Pin Electronics) Specific functions
//**********************************************************************************
// Channels Output API calls
void WINAPI DioSetupOutputVoltages(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dHiLevel, DOUBLE dLoLevel, PSHORT pnStatus);
void WINAPI DioGetOutputVoltages(SHORT nHandle, SHORT nChannel, PDOUBLE pdHiLevel, PDOUBLE pdLoLevel, PSHORT pnStatus);

// Channels Input API calls
void WINAPI DioSetupInputThresholdVoltages(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dHiLevel, DOUBLE dLoLevel, PSHORT pnStatus);
void WINAPI DioGetInputThresholdVoltages(SHORT nHandle, SHORT nChannel, PDOUBLE pdHiLevel, PDOUBLE pdLoLevel, PSHORT pnStatus);

// Reads the channel's input thresholds comparators state
#define DIO_INPUT_LEVEL_BELOW_LOW_THRESHOLD					0	// Input signal is lower than low and high threshold value.
#define DIO_INPUT_LEVEL_BETWEEN_LOW_AND_HIGH_THRESHOLD		-1	// Input signal is between the low and high threshold value (invalid signal level).
#define DIO_INPUT_LEVEL_ABOVE_HIGH_THRESHOLD				1	// Input signal is above the low and high threshold value.
void WINAPI DioReadInputState(SHORT nHandle, SHORT nChannel, PSHORT pnState, PSHORT pnStatus);

// Load state
#define DIO_LOAD_DISCONNECTED					0
#define DIO_LOAD_CONNECTED						1

void WINAPI DioSetupInputLoadState(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nState, PSHORT pnStatus);
void WINAPI DioGetInputLoadState(SHORT nHandle, SHORT nChannel, PSHORT pnState, PSHORT pnStatus);

// Input Load Current
void WINAPI DioSetupInputLoadCurrent(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dISink, DOUBLE dISource, PSHORT pnStatus);
void WINAPI DioGetInputLoadCurrent(SHORT nHandle, SHORT nChannel, PDOUBLE pdISink, PDOUBLE pdISource, PSHORT pnStatus);
void WINAPI DioSetupInputLoadCommutatingVoltage(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dVComHi, DOUBLE dVComLo, PSHORT pnStatus);
void WINAPI DioGetInputLoadCommutatingVoltage(SHORT nHandle, SHORT nChannel, PDOUBLE pdVComHi, PDOUBLE pdVComLo, PSHORT pnStatus);

// Measure channel's signal
#define DIO_CH_TEMP								1
#define DIO_CH_IO_VOLTAGE						2
#define DIO_CH_OUTPUT_CURRENT					3
#define DIO_CH_PMU_CURRENT						4
#define DIO_CH_PMU_VOLTAGE						5
#define DIO_VCC									30
#define DIO_HIGH_RAIL							31
#define DIO_LOW_RAIL							32

// Measured temperature units
#define DIO_TEMP_CELSIUS						0
#define DIO_TEMP_FAHRENHEIT						1

void WINAPI DioMeasure(SHORT nHandle, SHORT nChannel, SHORT nSignal, PDOUBLE pdResult, DOUBLE dMeasurementRate, DOUBLE dOp1, DOUBLE dOp2, PSHORT pnStatus);

// Skew Delay source
#define DIO_SKEW_DELAY_OUTPUT_DATA				0
#define DIO_SKEW_DELAY_OUTPUT_DATA_ENABLE		1
#define DIO_SKEW_DELAY_INPUT_LOW_THRESHOLD		2
#define DIO_SKEW_DELAY_INPUT_HIGH_THRESHOLD		3

void WINAPI DioSetupSkewDelay(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nSource, SHORT nEdge, DOUBLE dDelay, PSHORT pnStatus);
void WINAPI DioGetSkewDelay(SHORT nHandle, SHORT nChannel, SHORT nSource, SHORT nEdge, PDOUBLE pdDelay, PSHORT pnStatus);

//------------------------------------------------------
//	PMU (Parametric Measurement Unit)
//------------------------------------------------------
// PMU Gx529X current ranges
#define GX529X_PMU_CURRENT_RANGE_N32MA_TO_P32MA		0	// PMU current range -32mA to +32mA
#define GX529X_PMU_CURRENT_RANGE_N8MA_TO_P8MA		1	// PMU current range -8mA to +8mA
#define GX529X_PMU_CURRENT_RANGE_N2MA_TO_P2MA		2	// PMU current range -2mA to +2mA
#define GX529X_PMU_CURRENT_RANGE_N512UA_TO_P512UA	3	// PMU current range -512uA to +512uA
#define GX529X_PMU_CURRENT_RANGE_N128UA_TO_P128UA	4	// PMU current range -128uA to +128uA
#define GX529X_PMU_CURRENT_RANGE_N32UA_TO_P32UA		5	// PMU current range -32uA to +32uA
#define GX529X_PMU_CURRENT_RANGE_N8UA_TO_P8UA		6	// PMU current range -8uA to +8uA
#define GX529X_PMU_CURRENT_RANGE_N2UA_TO_P2UA		7	// PMU current range -2uA to +2uA

// PMU Gx5055 current ranges
#define GX5055_PMU_CURRENT_RANGE_N200MA_TO_P200MA	0	// PMU current range -200mA to +200mA
#define GX5055_PMU_CURRENT_RANGE_N25MA_TO_P25MA		1	// PMU current range -32mA to +32mA

// PMU Forced Current
void WINAPI DioPmuSetupForcedCurrent(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dCurrent, SHORT nCurrentRange, PSHORT pnStatus);
void WINAPI DioPmuGetForcedCurrent(SHORT nHandle, SHORT nChannel, PDOUBLE pdCurrent, PSHORT pnCurrentRange, PSHORT pnStatus);

// PMU Forced Voltage Setup Mode
#define DIO_PMU_FV_SETUP_DEFAULT				0
#define DIO_PMU_FV_CHECK_FOR_OVER_CURRENT		1

// PMU Forced Voltage
void WINAPI DioPmuSetupForcedVoltage(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dVoltage, SHORT nCurrentRange, DWORD dwSetupMode, DOUBLE dMaxCurrent, PSHORT pnStatus);
void WINAPI DioPmuGetForcedVoltage(SHORT nHandle, SHORT nChannel, PDOUBLE pdVoltage, PSHORT pnCurrentRange, PSHORT pnStatus);

//**********************************************************************************
//	GX5295 Specific functions
//**********************************************************************************
// Reset Channels to default
void WINAPI DioResetChannels(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, PSHORT pnStatus);

// Over Temperature Status
void WINAPI DioGetOverTemperatureStatus(SHORT nHandle, PDWORD pdwOverTemp, PSHORT pnStatus);

// Channel Mode
#define DIO_CHANNEL_MODE_DYNAMIC_IO							0
#define DIO_CHANNEL_MODE_DISABLED							1
#define DIO_CHANNEL_MODE_OUTPUT_LOW							2
#define DIO_CHANNEL_MODE_OUTPUT_HIGH						3
#define DIO_CHANNEL_MODE_PMU_FORCE_CURRENT					4
#define DIO_CHANNEL_MODE_PMU_FORCE_VOLTAGE					5
#define DIO_CHANNEL_MODE_ONLY_INPUT_ENABLED					6

void WINAPI DioSetupChannelMode(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nMode, PSHORT pnStatus);
void WINAPI DioGetChannelMode(SHORT nHandle, SHORT nChannel, PSHORT pnMode, PSHORT pnStatus);

// Input Data Source for I/O channels and Timing Connector input signals
#define DIO_LOW_THRESHOLD_COMPARATOR		0
#define DIO_HIGH_THRESHOLD_COMPARATOR		1

// Input Data Source
void WINAPI DioGetInputDataSource(SHORT nHandle, SHORT nChannel, PSHORT pnInputDataSource, PSHORT pnStatus);
void WINAPI DioSetupInputDataSource(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nInputDataSource, PSHORT pnStatus);

//------------------------------------------------------
//	Tri-State Termination Voltage
//------------------------------------------------------
#define DIO_TRI_STATE_TERMINATION_MODE_DEFAULT	0
#define DIO_TRI_STATE_TERMINATION_MODE_LEVEL	1

void WINAPI DioSetupTriStateTerminationMode(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nMode, PSHORT pnStatus);
void WINAPI DioGetTriStateTerminationMode(SHORT nHandle, SHORT nChannel, PSHORT pnMode, PSHORT pnStatus);

void WINAPI DioSetupTriStateTerminationVoltage(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dVoltage, PSHORT pnStatus);
void WINAPI DioGetTriStateTerminationVoltage(SHORT nHandle, SHORT nChannel, PDOUBLE pdVoltage, PSHORT pnStatus);

//------------------------------------------------------
//	Auxiliary channels
//------------------------------------------------------
// Auxiliary channel that can be connected to input or output timing signals
#define DIO_AUX_CHANNEL_0					1000
#define DIO_AUX_CHANNEL_1					1001
#define DIO_AUX_CHANNEL_2					1002
#define DIO_AUX_CHANNEL_3					1003

// Connect Auxiliary channel to Timing Connector output signals
#define DIO_AUX_TO_EXTERNAL_OUT_DISABLED	0x0
#define DIO_AUX_TO_CLOCK_OUT				0x1
#define DIO_AUX_TO_STROBE_OUT				0x2
#define DIO_AUX_TO_RUN_OUT					0x4
#define DIO_AUX_TO_ARM_OUT					0x8

void WINAPI DioGetAuxiliaryToTimingOutput(SHORT nHandle, SHORT nAuxChannel, PDWORD pdwOutputSignal, PSHORT pnStatus);
void WINAPI DioSetupAuxiliaryToTimingOutput(SHORT nHandle, SHORT nAuxChannel, DWORD dwOutputSignal, PSHORT pnStatus);

// Connect Auxiliary channel to Timing Connector input signals
#define DIO_AUX_TO_EXTERNAL_INPUT_DISABLED		0x0
#define DIO_AUX_TO_EXTERNAL_CLOCK				0x1
#define DIO_AUX_TO_EXTERNAL_STROBE				0x2
#define DIO_AUX_TO_EXTERNAL_TRIGGER				0x4
#define DIO_AUX_TO_EXTERNAL_PAUSE				0x8
#define DIO_AUX_TO_EXTERNAL_CLOCK_ENABLE		0x10
#define DIO_AUX_TO_EXTERNAL_STROBE_ENABLE		0x20
#define DIO_AUX_TO_EXTERNAL_EVENT_LINE_0		0x100
#define DIO_AUX_TO_EXTERNAL_EVENT_LINE_1		0x200
#define DIO_AUX_TO_EXTERNAL_EVENT_LINE_2		0x400
#define DIO_AUX_TO_EXTERNAL_EVENT_LINE_3		0x800

// Input Data Source for Timing Connector input signals to Aux channels
#define DIO_AUX_LOW_THRESHOLD_COMPARATOR		0
#define DIO_AUX_HIGH_THRESHOLD_COMPARATOR		1

void WINAPI DioGetAuxiliaryToTimingInput(SHORT nHandle, SHORT nAuxChannel, PDWORD pdwInputComparator, PDWORD pdwInputSignal, PSHORT pnStatus);
void WINAPI DioSetupAuxiliaryToTimingInput(SHORT nHandle, SHORT nAuxChannel, DWORD dwInputComparator, DWORD dwInputSignal, PSHORT pnStatus);

// PMU Forced Current Commutating Voltage
void WINAPI DioPmuSetupForcedCurrentCommutatingVoltage(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dVComHi, DOUBLE dVComLo, PSHORT pnStatus);
void WINAPI DioPmuGetForcedCurrentCommutatingVoltage(SHORT nHandle, SHORT nChannel, PDOUBLE pdVComHi, PDOUBLE pdVComLo, PSHORT pnStatus);

// PMU Comparators Source
#define DIO_PMU_COMPARATORS_SOURCE_IO_VOLTAGE			0
#define DIO_PMU_COMPARATORS_SOURCE_FORCED_CURRENT		1

void WINAPI DioPmuSetupComparatorsSource(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nSource, PSHORT pnStatus);
void WINAPI DioPmuGetComparatorsSource(SHORT nHandle, SHORT nChannel, PSHORT pnSource, PSHORT pnStatus);

void WINAPI DioPmuSetupComparatorsValues(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dHiLevel, DOUBLE dLoLevel, PSHORT pnStatus);
void WINAPI DioPmuGetComparatorsValues(SHORT nHandle, SHORT nChannel, PDOUBLE pdHiLevel, PDOUBLE pdLoLevel, PSHORT pnStatus);

// Returns the channel's Comparison result
#define DIO_PMU_LOW_LEVEL_COMPARATOR_BIT		0
#define DIO_PMU_HIGH_LEVEL_COMPARATOR_BIT		1
#define DIO_PMU_ERROR_BIT						2

void WINAPI DioPmuGetComparisonResult(SHORT nHandle, SHORT nChannel, PDWORD pdwComparisonResult, PSHORT pnStatus);

//**********************************************************************************
//	GX5055 Specific functions
//**********************************************************************************
// Data format
#define DIO_DATA_FORMAT_NO_RETURN				0
#define DIO_DATA_FORMAT_RETURN_TO_ZERO			1
#define DIO_DATA_FORMAT_RETURN_TO_ONE			2
#define DIO_DATA_FORMAT_RETURN_TO_HI_Z			3
#define DIO_DATA_FORMAT_RETURN_TO_COMPLEMENT	4

void WINAPI DioSetupOutputDataFormat(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, SHORT nDataFormat, PSHORT pnStatus);
void WINAPI DioGetOutputDataFormat(SHORT nHandle, SHORT nChannel, PSHORT pnDataFormat, PSHORT pnStatus);

// Connect power to the Pin Electronics
#define DIO_POWER_DISCONNECT					0   // disconnect power for cooling/power save, default
#define DIO_POWER_FROM_FRONT					1   // external PS supplied to J7
#define DIO_POWER_FROM_BACKPLANE				2   // High power chassis (Marvin Test Solutions specific)

void WINAPI DioSetPowerConnect(SHORT nHandle, SHORT nPowerSource, PSHORT pnStatus);
void WINAPI DioGetPowerConnect(SHORT nHandle, PSHORT pnPowerSource, PSHORT pnStatus);

//**********************************************************************************
//	High Power Supply Functions
//**********************************************************************************
//Power Supply Functions, High Power Chassis Only (e.g. Gx7005A)
// High power chassis supply limits
#define DIO_POWER_SUPPLY_VCC_MAX_VOLTAGE		28.0
#define DIO_POWER_SUPPLY_VEE_MAX_VOLTAGE		18.0
#define DIO_POWER_SUPPLY_VCC_MIN_VOLTAGE		10.0
#define DIO_POWER_SUPPLY_VEE_MIN_VOLTAGE		4.0
#define DIO_POWER_SUPPLY_MAX_SWING				35

//dVoltage:
// VCC must be between 10.0 and 28.0 Volts
// VEE	must be between 3.0 and 28.0 Volts
// Voltage swing between VCC and VEE must be less than 33.5V
void WINAPI DioPowerSupplyGetRailsVoltage(SHORT nHandle, PDOUBLE pdVcc, PDOUBLE pdVee, PSHORT pnStatus);
void WINAPI DioPowerSupplySetRailsVoltage(SHORT nHandle, DOUBLE dVcc, DOUBLE dVee, PSHORT pnStatus);

//Measure nSource Parameter
#define DIO_POWER_SUPPLY_VCC1_VOLTAGE			0
#define DIO_POWER_SUPPLY_VCC2_VOLTAGE			1
#define DIO_POWER_SUPPLY_VEE_VOLTAGE			2
#define DIO_POWER_SUPPLY_VDD_VOLTAGE			3
#define DIO_POWER_SUPPLY_VCC1_CURRENT			10
#define DIO_POWER_SUPPLY_VCC2_CURRENT			11
#define DIO_POWER_SUPPLY_VEE_CURRENT			12
#define DIO_POWER_SUPPLY_VDD_CURRENT			13

// Measure
void WINAPI DioPowerSupplyMeasure(SHORT nHandle, SHORT nSource, PDOUBLE pdVoltage, PSHORT pnStatus);

//nState
#define DIO_POWER_SUPPLY_RAILS_DISABLE			0
#define DIO_POWER_SUPPLY_RAILS_ENABLE			1
// Non-Volatile saved on the PS
void WINAPI DioPowerSupplyGetRailsState(SHORT nHandle, PSHORT pnState, PSHORT pnStatus);
void WINAPI DioPowerSupplySetRailsState(SHORT nHandle, SHORT nState, PSHORT pnStatus);
// Interface Status
void WINAPI DioPowerSupplyGetStatus(SHORT nHandle, PDWORD pdwStatus, PSHORT pnStatus);

// Check if current chassis can is a high power chassis and can be controlled by the DIO board
void WINAPI DioPowerSupplyIsSupported(SHORT nHandle, PBOOL pbSupported, PSHORT pnStatus);

// Power Supply Reset Fault: resets the power supply fault condition, 
// disconnects all Gx5055, and set the power supply VCC=+12V, VEE=-12V
void WINAPI DioPowerSupplyResetFault(SHORT nHandle, PSHORT pnStatus);

//**********************************************************************************
//	GX5055 (Pin Electronics) Specific functions
//**********************************************************************************
// Channels Output API calls
void WINAPI DioSetupOutputSlewRate(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dRisingEdge, DOUBLE dFallingEdge, DOUBLE dBias, PSHORT pnStatus);
void WINAPI DioGetOutputSlewRate(SHORT nHandle, SHORT nChannel, PDOUBLE pdRisingEdge, PDOUBLE pdFallingEdge, PDOUBLE pdBias, PSHORT pnStatus);

void WINAPI DioSetupOutputCurrentLimits(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dLimitHigh, DOUBLE dLimitLow, BOOL bEnabled, PSHORT pnStatus);
void WINAPI DioGetOutputCurrentLimits(SHORT nHandle, SHORT nChannel, PDOUBLE pdLimitHigh, PDOUBLE pdLimitLow, PBOOL pbEnabled, PSHORT pnStatus);

// Channels Output Over Current 
void WINAPI DioSetupOutputOverCurrentEnable(SHORT nHandle, DWORD dwOverCurrentEnable, PSHORT pnStatus);
void WINAPI DioGetOutputOverCurrentEnable(SHORT nHandle, PDWORD pdwOverCurrentEnable, PSHORT pnStatus);
void WINAPI DioGetOutputOverCurrentStates(SHORT nHandle, PDWORD pdwOverCurrentHi, PDWORD pdwOverCurrentLo, PSHORT pnStatus);
void WINAPI DioResetOutputOverCurrentStates(SHORT nHandle, PSHORT pnStatus);

// Input Resistive Load
#define DIO_RESISTIVE_LOAD_240_OHMS				240
#define DIO_RESISTIVE_LOAD_290_OHMS				290
#define DIO_RESISTIVE_LOAD_1K_OHMS				1000
#define DIO_RESISTIVE_LOAD_OPEN					-1

void WINAPI DioSetupInputLoadResistance(SHORT nHandle, SHORT nChannelListMode, SHORT nCountOrFirstChannel, PSHORT panChannelList, SHORT nLastChannel, DOUBLE dPullup, DOUBLE dPulldown, PSHORT pnStatus);
void WINAPI DioGetInputLoadResistance(SHORT nHandle, SHORT nChannel, PDOUBLE pdPullup, PDOUBLE pdPulldown, PSHORT pnStatus);

// Static I/O
void WINAPI DioGetIOPinsStaticDirection(SHORT nHandle, PDWORD pdwDirection, PSHORT pnStatus);
void WINAPI DioSetupIOPinsStaticDirection(SHORT nHandle, DWORD dwDirection, PSHORT pnStatus);

//***********************************************************************************
// DIO DSR Specific functions
//***********************************************************************************
// Constants

// PXI Trigger Bus
#define DSR_PXI_TRIGGER_LINE0					0
#define DSR_PXI_TRIGGER_LINE1					1
#define DSR_PXI_TRIGGER_LINE2					2
#define DSR_PXI_TRIGGER_LINE3					3
#define DSR_PXI_TRIGGER_LINE4					4
#define DSR_PXI_TRIGGER_LINE5					5
#define DSR_PXI_TRIGGER_LINE6					6
#define DSR_PXI_TRIGGER_LINE7					7
#define DSR_PXI_TRIGGER_LINE_NONE				-1

// Qualifier Control number
#define DSR_CONTROL_QUALIFIER0					0
#define DSR_CONTROL_QUALIFIER1					1

// Qualifier Control Operation
#define DSR_CONTROL_IGNORE_Q0_AND_Q1			0
#define DSR_CONTROL_LOGIC_Q0_AND_Q1				1
#define DSR_CONTROL_LOGIC_Q0_OR_Q1				2
#define DSR_CONTROL_IGNORE_Q0					3
#define DSR_CONTROL_IGNORE_Q1					4

// Qualifier Active Mode
#define DSR_CONTROL_QUALIFIER_ACTIVE_LOW		0
#define DSR_CONTROL_QUALIFIER_ACTIVE_HIGH		1

// Qualifier logic mode
#define DSR_CONTROL_QUALIFIER_LOGICAL_AND		0
#define DSR_CONTROL_QUALIFIER_LOGICAL_OR		1

// Control Event
#define DSR_CONTROLLER_TRIGGER_EVENT			0	
#define DSR_CONTROLLER_START_EVENT				1
#define DSR_CONTROLLER_STOP_EVENT				2

// PXI Trigger Line state
#define DSR_PXI_TRIGGER_LINE_DISABLE			0
#define DSR_PXI_TRIGGER_LINE_ENABLE				1

// Control External Trigger Polarity
#define DSR_CONTROLLER_EXT_EVENT_POLARITY_POS	0
#define DSR_CONTROLLER_EXT_EVENT_POLARITY_NEG	1

// Stop Control Mode
#define DSR_CONTROLLER_STOP_NO_CONDITION		0
#define DSR_CONTROLLER_STOP_ON_EXTERNAL			1
#define DSR_CONTROLLER_STOP_ON_GEN_DEPTH		2
#define DSR_CONTROLLER_STOP_ON_REC_DEPTH		4

// Trigger Source
#define DSR_TRIGGER_SOURCE_INTERNAL				0
#define DSR_TRIGGER_SOURCE_PXI_TRIGGER_LINE		0

// Trigger Control Mode
#define DSR_TRIGGER_MODE_WAIT_FOR_TRIGGER		0
#define DSR_TRIGGER_MODE_CONTINUOUS				1

// Start Control Mode
#define DSR_START_MODE_WAIT_FOR_TRIGGER			0
#define DSR_START_MODE_CONTINUOUS				1

// Vector Count
#define DSR_MIN_VECTOR_COUNT					0
#define DSR_MAX_VECTOR_COUNT					1048576

// Cycle Memory
#define DSR_CYCLE_MEMORY_MIN_COUNT				1
#define DSR_CYCLE_MEMORY_MAX_COUNT				256

// Strobe Source
#define DSR_CYCLE_MEMORY_STROBE_RECODER			0
#define DSR_CYCLE_MEMORY_STROBE_GENERATOR		1

// Cycle Memory strobe state
#define DSR_CYCLE_MEMORY_STROBE_DISABLE			0
#define DSR_CYCLE_MEMORY_STROBE_ENABLE			1

// Cycle Memory Strobe line
#define DSR_CYCLE_MEMORY_STROBE_LINE0			0
#define DSR_CYCLE_MEMORY_STROBE_LINE1			1
#define DSR_CYCLE_MEMORY_STROBE_LINE2			2
#define DSR_CYCLE_MEMORY_STROBE_LINE3			3
#define DSR_CYCLE_MEMORY_STROBE_LINE4			4
#define DSR_CYCLE_MEMORY_STROBE_LINE5			5
#define DSR_CYCLE_MEMORY_STROBE_LINE6			6
#define DSR_CYCLE_MEMORY_STROBE_LINE7			7

// Cycle Memory Control flag
#define DSR_CYCLE_MEMORY_CTRL_FLAG0				0
#define DSR_CYCLE_MEMORY_CTRL_FLAG1				1

// Cycle Memory Control flag active state
#define DSR_CYCLE_MEMORY_CTRL_FLAG_ACTIVE_LOW	0
#define DSR_CYCLE_MEMORY_CTRL_FLAG_ACTIVE_HIGH	1
#define DSR_CYCLE_MEMORY_CTRL_FLAG_DISABLE		2

// Clock Divider
#define DSR_CONTROLLER_MIN_CLOCK_DIVIDER		1
#define DSR_CONTROLLER_MAX_CLOCK_DIVIDER		65536

// DIO DSR functions
void WINAPI DioDsrGetGeneratorLoopValues(SHORT nMasterHandle, PDWORD pdwStartStep, PDWORD pdwLastStep, PDWORD pdwNumLoops, PSHORT pnStatus);
void WINAPI DioDsrSetupGeneratorLoopValues(SHORT nMasterHandle, DWORD dwStartStep, DWORD dwLastStep, DWORD dwNumLoops, PSHORT pnStatus);
void WINAPI DioDsrGetClockDivider(SHORT nMasterHandle, PDWORD pdwClockDivider, PSHORT pnStatus);
void WINAPI DioDsrSetupClockDivider(SHORT nMasterHandle, DWORD dwClockDivider, PSHORT pnStatus);

// Connect Controller Trig/Start/Stop events to PXI Trigger Line
void WINAPI DioDsrSetupControllerToPxiTriggerLine(SHORT nMasterHandle, SHORT nEvent, SHORT nPxiTriggerLine, PSHORT pnStatus);
void WINAPI DioDsrGetControllerToPxiTriggerLine(SHORT nMasterHandle, SHORT nEvent, PSHORT pnPxiTriggerLine, PSHORT pnStatus);

// Controller to PXI Trigger Bus/Line State
void WINAPI DioDsrSetupControllerToPxiTriggerBusState(SHORT nMasterHandle, SHORT nBusState, PSHORT pnStatus);
void WINAPI DioDsrGetControllerToPxiTriggerBusState(SHORT nMasterHandle, PSHORT pnBusState, PSHORT pnStatus);
void WINAPI DioDsrSetupControllerToPxiTriggerLineState(SHORT nMasterHandle, SHORT nLine, SHORT pnEnable, PSHORT pnStatus);
void WINAPI DioDsrGetControllerToPxiTriggerLineState(SHORT nMasterHandle, SHORT nLine, PSHORT pnEnable, PSHORT pnStatus);

// PXI Trigger Line to Controller
void WINAPI DioDsrSetupPxiTriggerLineToController(SHORT nMasterHandle, SHORT nEvent, SHORT nPxiTriggerLine, PSHORT pnStatus);
void WINAPI DioDsrGetPxiTriggerLineToController(SHORT nMasterHandle, SHORT nEvent, PSHORT pnPxiTriggerLine, PSHORT pnStatus);
void WINAPI DioDsrSetupPxiTriggerLineToControllerState(SHORT nMasterHandle, SHORT nEvent, SHORT nEnable, PSHORT pnStatus);
void WINAPI DioDsrGetPxiTriggerLineToControllerState(SHORT nMasterHandle, SHORT nEvent, PSHORT pnEnable, PSHORT pnStatus);

// Controller External Trig/Start/Stop Polarity
void WINAPI DioDsrSetupControllerExternalEventPolarity(SHORT nMasterHandle, SHORT nEvent, SHORT nPolarity, PSHORT pnStatus);
void WINAPI DioDsrGetControllerExternalEventPolarity(SHORT nMasterHandle, SHORT nEvent, PSHORT pnPolarity, PSHORT pnStatus);

// Ext Trigger Qualifier
void WINAPI DioDsrSetupControllerExtTriggerQualifierActiveLevel(SHORT nMasterHandle, SHORT nQualifier, SHORT nLevel, PSHORT pnStatus);
void WINAPI DioDsrGetControllerExtTriggerQualifierActiveLevel(SHORT nMasterHandle, SHORT nQualifier, PSHORT pnLevel, PSHORT pnStatus);
void WINAPI DioDsrSetupControllerExtTriggerQualifiersMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioDsrGetControllerExtTriggerQualifiersMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);

// Controller Trig/Start/Stop Mode
void WINAPI DioDsrSetupControllerTriggerMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioDsrGetControllerTriggerMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioDsrSetupControllerStartMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioDsrGetControllerStartMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioDsrSetupControllerStopCondition(SHORT nMasterHandle, SHORT nCondition, PSHORT pnStatus);
void WINAPI DioDsrGetControllerStopCondition(SHORT nMasterHandle, PSHORT pnCondition, PSHORT pnStatus);

// Dio Dsr Flow-control functions
void WINAPI DioDsrHaltOnEndOfCycle(SHORT nMasterHandle, PSHORT pnStatus);
void WINAPI DioDsrPauseOnEndOfCycle(SHORT nMasterHandle, PSHORT pnStatus);

void WINAPI DioDsrSetupRecorderDepth(SHORT nMasterHandle, DWORD dwDepth, PSHORT pnStatus);
void WINAPI DioDsrGetRecorderDepth(SHORT nMasterHandle, PDWORD pdwDepth, PSHORT pnStatus);
void WINAPI DioDsrReadRecorderVectorCount(SHORT nMasterHandle, PDWORD pdwRecVectorCount, PSHORT pnStatus);

void WINAPI DioDsrSetupGeneratorDepth(SHORT nMasterHandle, DWORD dwDepth, PSHORT pnStatus);
void WINAPI DioDsrGetGeneratorDepth(SHORT nMasterHandle, PDWORD pdwDepth, PSHORT pnStatus);
void WINAPI DioDsrReadGeneratorVectorCount(SHORT nMasterHandle, PDWORD pdwGenVectorCount, PSHORT pnStatus);

void WINAPI DioDsrWriteMajorCycleMemory(SHORT nMasterHandle, DWORD dwStart, DWORD dwCount, PDWORD pdwData, PSHORT pnStatus);
void WINAPI DioDsrReadMajorCycleMemory(SHORT nMasterHandle, DWORD dwStart, DWORD dwCount, PDWORD pdwData, PSHORT pnStatus);
void WINAPI DioDsrWriteMajorCycleMemoryProgramCounter(SHORT nMasterHandle, DWORD dwCounter, PSHORT pnStatus);
void WINAPI DioDsrReadMajorCycleMemoryProgramCounter(SHORT nMasterHandle, PDWORD pdwCounter, PSHORT pnStatus);

//************************************************************************************
//	I/O Modules functions
//************************************************************************************
void WINAPI DioGetTermination (SHORT nHandle, PSHORT pnTermination, PSHORT pnStatus);
void WINAPI DioSetupTermination (SHORT nHandle, SHORT nTermination, PSHORT pnStatus);
void WINAPI DioGetIOModuleType(SHORT nHandle, PSHORT pnType, PSHORT pnStatus);

// Level Shifter modules functions
void WINAPI DioLevelShifterGetLoadResistance(SHORT nHandle, SHORT nGroup, PDWORD pdwLoadVal, PSHORT pnStatus);
void WINAPI DioLevelShifterGetOutputMode (SHORT nHandle, PSHORT pnMode, PSHORT pnStatus);
void WINAPI DioLevelShifterGetSummary(SHORT nHandle, PSTR pszBoardSum, SHORT nSumMaxLen, PSHORT pnStatus);
void WINAPI DioLevelShifterGetVoltage (SHORT nHandle, SHORT nGroup, PDOUBLE pdLowVoltage, PDOUBLE pdHighVoltage, PDOUBLE pdThresholdVoltage, PSHORT pnStatus);
void WINAPI DioLevelShifterSetByLogicFamily (SHORT nHandle, SHORT nGroup, SHORT nLogicFamily, PSHORT pnStatus);
void WINAPI DioLevelShifterSetLoadResistance(SHORT nHandle, SHORT nGroup, DWORD dwLoadVal, PSHORT pnStatus);
void WINAPI DioLevelShifterSetOutputMode (SHORT nHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioLevelShifterSetVoltage (SHORT nHandle, SHORT nGroup, DOUBLE dLowVoltage, DOUBLE dHighVoltage, DOUBLE dThresholdVoltage, PSHORT pnStatus);

// Frequency Doubler
void WINAPI DioFreqDoublerSetupClkSource (SHORT nHandle, SHORT nClkSource, PSHORT pnStatus);
void WINAPI DioFreqDoublerGetClkSource (SHORT nHandle, PSHORT pnClkSource, PSHORT pnStatus);

//************************************************************************************
//	File functions
//************************************************************************************
// File types
#define FILE_TYPE_DIO							0
#define FILE_TYPE_ASC							1
#define FILE_TYPE_ASC_COMMAND					2

// File format
#define DFTYPE_DIO								0
#define DFTYPE_RAW_ASCII						1
#define DFTYPE_ASCII_W_COM						2
#define DFTYPE_OLD_ASCII_W_COM					3
#define DFTYPE_OLD_DIO							4
#define DFTYPE_SUMMATION_DSR					5
#define DFTYPE_DIOX								6 // Cross platform file format (supports Windows, LabView RT and Linux)

// file constants
#define DIO_FILE_READ							0 // Open for read. If file not exist or cannot be found, the function call fails.
#define DIO_FILE_READ_WRITE						1 // Open existing file for read/write. If file not exist or cannot be found, the function fails.
#define DIO_FILE_CREATE							2 // Create a new file. If file exists, overwrite it, the existing file is saved as "filename_.dio"

// file min number of steps
#define	DIO_FILE_MIN_NUM_STEPS					32

void WINAPI DioLoadFile(SHORT nMasterHandle, LPCSTR szFileName, DWORD dwFileStart, DWORD dwStart, PDWORD pdwSize, PSHORT pnStatus);
void WINAPI DioSaveFile(SHORT nMasterHandle, LPCSTR szFileName, DWORD dwStart, PDWORD pdwSize, PSHORT pnStatus);
void WINAPI DioCompareFiles(PSTR pszFileName1, PSTR pszFileName2, PDWORD pdwStep1, PDWORD pdwStep2, PDWORD pdwIn1, PDWORD pdwIn2, SHORT nBoards, PSHORT pnStatus);

// creating or editing DIO file from the driver
void WINAPI DioFileClose(SHORT hFile, PSHORT pnStatus);
void WINAPI DioFileConvert(PCSTR pszSourceFile, PSTR pszDestFile, SHORT nDestFileType, PSHORT pnStatus);
void WINAPI DioFileDeleteBoard(SHORT hFile, SHORT nBoard, PSHORT pnStatus);
void WINAPI DioFileGetBoardHandle(SHORT hFile, SHORT nBoard, PSHORT phFileBoard,  PSHORT pnStatus);
void WINAPI DioFileGetHandle(LPCSTR sFullFilename, PSHORT phFile, PSHORT pnStatus);
void WINAPI DioFileGetNumberOfBoards (SHORT hFile, PSHORT pnNumBoards, PSHORT pnStatus);
void WINAPI DioFileGetNumberOfSteps(SHORT hFile, PDWORD pdwSteps,  PSHORT pnStatus);
void WINAPI DioFileInsertBoard (SHORT hFile, SHORT nBoard,  PSHORT phFileBoard, PSHORT pnStatus);
void WINAPI DioFileOpen(LPCSTR szFilename, SHORT nMode, PSHORT pnBoardType, PSHORT phFile, PSHORT pnStatus);
void WINAPI DioFileSetNumberOfSteps (SHORT hFile, DWORD dwSteps,  PSHORT pnStatus);
void WINAPI DioFileSetChannelName(SHORT hFile, SHORT nChannel, PSTR pszChannelName, SHORT nMaxLength, PSHORT pnStatus);
void WINAPI DioFileGetChannelName(SHORT hFile, SHORT nChannel, PSTR pszChannelName, SHORT nMaxLength, PSHORT pnStatus);
void WINAPI DioFileReadIgnoreData(SHORT hFile, PVOID pvIgnore, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioFileWriteIgnoreData(SHORT hFile, PVOID pvIgnore, DWORD dwStart, DWORD dwSize, PSHORT pnStatus);
void WINAPI DioFileSetLabel(SHORT hFile, DWORD dwStep, PSTR pszLabel, PSHORT pnStatus);
void WINAPI DioFileGetLabel(SHORT hFile, DWORD dwStep, PSTR pszLabel, SHORT nMaxLength, PSHORT pnStatus);
void WINAPI DioFileFindLabel(SHORT hFile, DWORD dwStartStep, PDWORD pdwStepLabel, PSTR pszLabel, PSHORT pnStatus);
void WINAPI DioFileFindLabelSubstring (SHORT hFile, DWORD dwStartStep, PDWORD pdwStepLabel, PSTR pszLabelSubstring, PSHORT pnStatus);
void WINAPI DioFileSetLoadOptions(SHORT hFile, DWORD dwFileLoadOptions, PSHORT pnStatus);
void WINAPI DioFileGetLoadOptions(SHORT hFile, PDWORD pdwFileLoadOptions, PSHORT pnStatus);

// File Load Options
#define	DIO_FILE_LOAD_ALL_DOMAIN_RESET_ON_FILE_LOAD	0
#define	DIO_FILE_NO_DOMAIN_RESET_ON_FILE_LOAD		1
#define	DIO_FILE_LOAD_DATA_ONLY						2
#define	DIO_FILE_LOAD_SETTINGS_ONLY					4

//**********************************************************************************
// Convert WGL/STIL/VCD/eVCD file to a DIO file
//**********************************************************************************
void WINAPI DioFileImportPanel(HWND hwndParent);
void WINAPI DioFileImport(PCSTR pszInputFile, PCSTR pszOutputDioFile, SHORT nBoardType, BOOL bRealtimeCompare, PSTR pszImportOptions, LONG * plImportOptionsMaxLen, BOOL bWait, HANDLE* phHandle, PSTR pszStatus, SHORT nStatusMaxLen, PSHORT pnStatus);
void WINAPI DioFileImportGetProgress(HANDLE hHandle, BOOL bCancel, PSTR pszStatus, SHORT nStatusMaxLen, PSHORT pnStatus);

//**********************************************************************************
// DIO domain functions
//**********************************************************************************
#define DIO_OPERATING_MODE_DEFAULT					0
#define DIO_OPERATING_MODE_REAL_TIME_COMPARE		1

void WINAPI DioDomainSetupOperatingMode(SHORT nMasterHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioDomainGetOperatingMode(SHORT nMasterHandle, PSHORT pnMode, PSHORT pnStatus);

//************************************************************************************
//	Advance Settings mode (Used only in special cases)
//************************************************************************************
void WINAPI DioSetAdvanceSettingsMode (SHORT nHandle, DWORD dwMode, PSHORT pnStatus);
void WINAPI DioGetAdvanceSettingsMode (SHORT nHandle, PDWORD pdwMode, PSHORT pnStatus);

// Operation mode constants
#define DIO_ADVANCE_SETTINGS_MODE_NONE				0
#define DIO_ADVANCE_SETTINGS_MODE_PS2				1

//************************************************************************************
//	Special operation mode (GC5050/GX5050 only, ARM/TRIG/HAL acceleration)
//************************************************************************************
// Special Operation mode
#define OP_MODE_NORMAL							0x00 // GC5050/GX5050 only
#define OP_MODE_FAST_ARM						0x10 // GC5050/GX5050 only
#define OP_MODE_FAST_TRIG						0x20 // GC5050/GX5050 only
#define OP_MODE_FAST_HALT						0x40 // GC5050/GX5050 only

void WINAPI DioSetOperationMode (SHORT nHandle, SHORT nMode, PSHORT pnStatus);
void WINAPI DioGetOperationMode (SHORT nHandle, PSHORT pnMode, PSHORT pnStatus);

//**********************************************************************************
//	GX5295 Special functions												 
//**********************************************************************************
// Special function for SPI communication
//-----------------------------------------------------------------------------
void WINAPI DioWriteChannelSerialValue(SHORT nHandle, SHORT nMemory, SHORT nChannel, DWORD dwStartStep, DWORD dwNumOfSteps, PBYTE pucSerialValue, PSHORT pnStatus);

#ifdef __cplusplus
}	// End of extern "C" {
#endif

#endif // __GTDIO_H__

//****************************************************************************
//    END - OF - FILE
//****************************************************************************

