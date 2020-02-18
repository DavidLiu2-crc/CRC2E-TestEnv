<?xml version="1.0"?><doc>
<members>
<member name="M:AnokiObj.convertSeqToASCII" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="20">
<summary>
Converts the hex values in commandSequence and transposes them into binary ascii steps
</summary>
<returns>None
<para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
</member>
<member name="M:AnokiObj.setCommandSequence(System.Byte*,System.Byte,System.Byte,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="26">
<summary>
Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence
</summary>
<param name="pCmdSeq"> Pointer to the command sequence hex array</param>
<param name="_sendLength"> Counter for number of bytes to send</param>
<param name="_readLength"> Counter for number of bytes to expect to read</param>
<param name="_log"> std::string containing function called information (readable format)</param>
</member>
<member name="T:AnokiCommand" decl="false" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="42">
<summary>

</summary>
<param name=""></param>
<returns><c> </c></returns>
<example><code>

</code></example>
<seealso></seealso>
</member>
<member name="M:AnokiCommand.cmd_SetScratchValue(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="60">
<summary>
Sets the command sequence to write a value into the scratch register.
<para>Header byte + double to 4 bytes + checksum.</para>
</summary>
<param name="_nScratchValue">Hexadecimal value to load onto register</param>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_ReadScratchRequest" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="68">
<summary>
Sets the command sequence to read the scratch value
</summary>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_RequestFixedSequence" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="74">
<summary>
Sets the command sequence to read the fixed value
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_PAAPointingCommand" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="80">
<summary>
Sends the command to point the beam with mode, angles and frequency of current instance setting.
Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_ArrayConfigurationRequest" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="88">
<summary>
Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_FactoryReset" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="94">
<summary>
Sends the command to reset the PAA device to factory settings.
Takes value from <c>paramFactoryReset</c> as reset flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_EnableBeam" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="102">
<summary>
Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusSummaryRequest" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="108">
<summary>
Sends the command to return the summary status
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusDetailRequest" decl="true" source="C:\Users\chuqi.liu\Documents\GitHub\CRC2E-TestEnv\anokiwave-gui\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="114">
<summary>
Sends the command to return the summary detail
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
</members>
</doc>