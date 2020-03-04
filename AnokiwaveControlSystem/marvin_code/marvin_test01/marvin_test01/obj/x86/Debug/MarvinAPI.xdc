<?xml version="1.0"?><doc>
<members>
<member name="M:MarvinAPI.cmd_SetConnection(System.Int16,System.Int16,System.Int16,System.Int16)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="43">
<summary>
Simple function to initialize the card locating in <c>nSlotNum</c> with connector of type <c>interfaceType</c>.
</summary>
<param name="_nSlotNum">unsigned int defining the slot number. See PXI/PCI Explorer.</param>
<param name="_nInterfaceType">int representing the connector type, 0:TTL, 1:LVDS</param>
<param name="_nExpectBoard">short representing board ID found connected (0x70 default GX5292) </param>
<param name="_nOperatingMode">short representing 0:Default, 1:Real-Time Compare</param>
</member>
<member name="M:MarvinAPI.cmd_StartConnection" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="52">
<summary>
Starts connection with Marvin Card located at nSlotNum.
Connects to board at nSlotNum, gets the board to check if recognized (default 0x70 GX5292)
</summary>
</member>
<member name="M:MarvinAPI.cmd_ConfigureHandle(System.Int16)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="58">
<summary>
Setting up the following attributes (card handle or file handle)
<list type="bullet">
<item> Input Interface (0:TTL, 1:LVDS)</item>
<item> Io Configuration (Channel Width) </item>
<item> Frequency (Hz) </item>
<item> Operating mode </item>
<item> Channel Output state </item>
<item> Output state </item>
<item> Voltage </item>
</list>
</summary>
<param name="nHandle"></param>
</member>
<member name="M:MarvinAPI.cmd_StartDIOLoad(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="76">
<summary>
Create a DIO File and set the number of steps for that file
</summary>
<param name="_numSteps"></param>
</member>
</members>
</doc>