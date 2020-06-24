#pragma once

// DLL export keywords
#ifdef ANOKIWAVECONTROLLERLIBRARY_EXPORTS
#define ANOKIWAVECONTROLLERLIBRARY_API __declspec(dllexport)
#else
#define ANOKIWAVECONTROLLERLIBRARY_API __declspec(dllimport)
#endif

#ifdef __cplusplus
extern "C" {
#endif

ANOKIWAVECONTROLLERLIBRARY_API void CMD_ConnectToMarvinCard();

ANOKIWAVECONTROLLERLIBRARY_API bool CMD_LoadPointingAngles(char* outputFileName, float freq, float dwell);

ANOKIWAVECONTROLLERLIBRARY_API void CMD_GetCommandBitSequence(unsigned char** commandBitSequence, unsigned long* commandBitLength);

ANOKIWAVECONTROLLERLIBRARY_API bool CMD_outputCommandBitSequence(char* pnOutputBINFile);

ANOKIWAVECONTROLLERLIBRARY_API void CMD_LoadMarvinCard();

ANOKIWAVECONTROLLERLIBRARY_API void CMD_RunMarvinCard();

#ifdef __cplusplus
}
#endif






