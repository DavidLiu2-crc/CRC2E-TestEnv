<?xml version="1.0"?><doc>
<members>
<member name="M:AnokiObj.setCommandSequence(System.Byte*,System.Byte,System.Byte,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="34">
<summary>
Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence
</summary>
<param name="pCmdSeq">Pointer to the command sequence hex array</param>
<param name="_sendLength">Counter for number of bytes to send</param>
<param name="_readLength">Counter for number of bytes to expect to read</param>
<param name="_log"> std::string containing function called information (readable format)</param>
</member>
<member name="M:AnokiObj.convertSeqToASCII" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="73">
<summary>
Converts the hex values in commandSequence and transposes them into binary ascii steps
</summary>
<returns>None
<para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
</member>
</members>
</doc>