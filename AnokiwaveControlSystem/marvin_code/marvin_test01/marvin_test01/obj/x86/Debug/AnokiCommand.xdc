<?xml version="1.0"?><doc>
<members>
<member name="M:__std_swap_ranges_trivially_swappable_noalias(System.Void*,System.Void*,System.Void*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="1">
	File name: AnokiObj.h

	Summary: User-defined object that contains information about Anokiwave Command

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Usage:  1. Initialize the object. Use constructor AnokiObj xxxAnoki(true) to set up double clock step implementation
			2. Call set_CommandSequence to set the command information
			3. Return or push the object into vector storage

	See also document: Anokiwave USB Documents
	ECCN: 5E991 - NLR : Table 4.1 page 8


</member>
<member name="M:AnokiObj.set_CommandSequence(System.Byte*,System.Byte,System.Byte,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="53">
<summary>
Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence.
</summary>
<param name="pCmdSeq">Pointer to the command sequence hex array</param>
<param name="_sendLength">Counter for number of bytes to send</param>
<param name="_readLength">Counter for number of bytes to expect to read</param>
<param name="_log"> std::string containing function called information (readable format)</param>
</member>
<member name="M:AnokiObj.cmd_memcpy(System.UInt32!System.Runtime.CompilerServices.IsLong*,System.UInt32*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="64">
<summary>
Copy the contents of binary sequence to an external pointer pCmd. For loop implementation
</summary>
<param name="pCmd">Unsigned long pointer to store the binary command steps</param>
<param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
<returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
</member>
<member name="M:AnokiObj.cmd_memcpy(System.Byte*,System.UInt32*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="71">
<summary>
Copy the contents of binary sequence to an external pointer pCmd. memcpy_s implementation
</summary>
<param name="pCmd">Unsigned long pointer to store the binary command steps</param>
<param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
<returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
</member>
<member name="M:AnokiObj.get_CmdSendLength" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="81">
<summary>
Returns the length of the send byte command
</summary>
<returns>unsigned char representing length of command</returns>
</member>
<member name="M:AnokiObj.get_CmdReadLength" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="86">
<summary>
Returns the length of the read byte command
</summary>
<returns>unsigned char representing length of expected command</returns>
</member>
<member name="M:AnokiObj.get_CmdLog" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="91">
<summary>
Returns the string of the readable command
</summary>
<returns></returns>
</member>
<member name="M:AnokiObj.show_CommandHex" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="99">
<summary>
Display the hex command sequence
</summary>
</member>
<member name="M:AnokiObj.show_CommandRaw" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="103">
<summary>
Display the ascii command sequence
</summary>
</member>
<member name="M:AnokiObj.show_CommandLog" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="107">
<summary>
Display the string containing command information
</summary>
</member>
<member name="M:AnokiObj.convertSeqToASCII" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="130">
<summary>
Converts the hex values in commandSequence and transposes them into binary ascii steps
</summary>
<returns>None
<para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
</member>
<member name="T:AnokiCommand" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="38">
<summary>

</summary>
<param name=""></param>
<returns><c> </c></returns>
<example><code>

</code></example>
<seealso></seealso>
</member>
<member name="M:AnokiCommand.cmd_SetScratchValue(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="64">
<summary>
Sets the command sequence to write a value into the scratch register.
<para>Header byte + double to 4 bytes + checksum.</para>
</summary>
<param name="_nScratchValue">Hexadecimal value to load onto register</param>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_ReadScratchRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="72">
<summary>
Sets the command sequence to read the scratch value
</summary>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_RequestFixedSequence" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="78">
<summary>
Sets the command sequence to read the fixed value
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_PAAPointingCommand" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="84">
<summary>
Sends the command to point the beam with mode, angles and frequency of current instance setting.
Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_ArrayConfigurationRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="92">
<summary>
Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_FactoryReset" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="98">
<summary>
Sends the command to reset the PAA device to factory settings.
Takes value from <c>paramFactoryReset</c> as reset flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_EnableBeam" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="107">
<summary>
Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusSummaryRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="113">
<summary>
Sends the command to return the summary status
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusDetailRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="119">
<summary>
Sends the command to return the summary detail
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
</members>
</doc>