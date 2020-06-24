#pragma once

// DLL export keywords
#ifdef ANOKIWAVECONTROLLERLIBRARY_EXPORTS
#define ANOKIWAVECONTROLLERLIBRARY_API __declspec(dllexport)
#else
#define ANOKIWAVECONTROLLERLIBRARY_API __declspec(dllimport)
#endif

extern "C" ANOKIWAVECONTROLLERLIBRARY_API void CMD_ConnectToMarvinCard();

extern "C" ANOKIWAVECONTROLLERLIBRARY_API unsigned char* CMD_LoadPointingAngles(double* angles, int len);

extern "C" ANOKIWAVECONTROLLERLIBRARY_API bool CMD_outputCommandBitSequence(char* outputFileName);

extern "C" ANOKIWAVECONTROLLERLIBRARY_API void CMD_LoadMarvinCard();

extern "C" ANOKIWAVECONTROLLERLIBRARY_API void CMD_RunMarvinCard();



