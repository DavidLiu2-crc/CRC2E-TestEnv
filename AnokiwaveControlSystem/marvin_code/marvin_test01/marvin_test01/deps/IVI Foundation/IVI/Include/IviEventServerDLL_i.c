

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0366 */
/* at Tue Sep 30 20:43:44 2008
 */
/* Compiler settings for .\IviEventServerDLL.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#pragma warning( disable: 4049 )  /* more than 64k source lines */


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_IIviEventEntry,0xBDFFA6BB,0x5C1D,0x473d,0xBC,0x93,0x9F,0x0D,0x4B,0xEB,0xA0,0xD0);


MIDL_DEFINE_GUID(IID, IID_IIviEventCallback,0x77C94050,0xF48A,0x4f3a,0x9A,0x1B,0x84,0xA1,0x81,0x5C,0xC7,0xF3);


MIDL_DEFINE_GUID(IID, IID_IIviEventCallbackFast,0xB54AFD7C,0xEC18,0x4c9d,0xA5,0xA0,0xB6,0x4B,0x0F,0xAA,0x32,0x39);


MIDL_DEFINE_GUID(IID, IID_IIviEventSource,0x93C815C7,0x917D,0x44ad,0xA7,0x01,0x14,0xBB,0x37,0xD0,0xAC,0xD7);


MIDL_DEFINE_GUID(IID, IID_IIviEventServer,0x04B5064D,0xA473,0x4bb0,0xBF,0xD2,0x10,0xCA,0xD9,0x7A,0xFA,0xF2);


MIDL_DEFINE_GUID(IID, IID_IIviEventManager,0x59FE2D65,0x65C3,0x4f92,0x95,0x57,0xFC,0x5F,0x82,0x3D,0xB5,0x10);


MIDL_DEFINE_GUID(IID, LIBID_IVIEVENTSERVERDLLLib,0xBB5043E8,0xBD42,0x49f7,0xAF,0x26,0xD8,0x2A,0x59,0x03,0x3F,0x03);


MIDL_DEFINE_GUID(CLSID, CLSID_IviEventServerDLL,0x07ADA726,0xFEC7,0x4f1e,0x9C,0xAF,0xA4,0x81,0xF4,0x54,0xF3,0x40);


MIDL_DEFINE_GUID(CLSID, CLSID_IviEventEntry,0x2E389BD2,0x9320,0x49c6,0x94,0x5F,0x05,0xAE,0x9E,0xB5,0x14,0xBE);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



