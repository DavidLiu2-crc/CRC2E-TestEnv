<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
  Copyright Keysight Technologies 2012-2019

XML transform for driver execution trace data output by an Keysight IVI driver.
The following line is the second line in the generated trace XML file:

<?xml-stylesheet type="text/xsl" href="file://C:/Program Files/IVI Foundation/IVI/Components/Keysight Technologies/trace.xslt"?>

To enable driver tracing include "DriverSetup= Trace=true" in the option string used with the
Initialize() method.  See driver help file topic "Initializing the IVI-COM Driver" for additional
tracing information.
-->

<xsl:template match="/">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <title> Keysight IVI Driver Trace Output </title>
 <body style="font-family:Arial,helvetica,sans-serif;font-size:90%;">
 <a name="FirstLine"></a>

<!-- 
<img src="/C:/Program Files/IVI Foundation/IVI/Components/Keysight Technologies/ktlogo.gif" alt="Keysight Technologies"/>
 -->
<b>&#160;Keysight Technologies </b><p/>


<center><font size="+1"><b>&#160;Keysight IVI Driver Trace Output &#160; &#160; </b></font>
<!-- 
     <script language="JavaScript">
       if (Date.parse(document.lastModified) != 0) {
         document.write(document.lastModified);
       }
     </script>
 -->
</center>
  <br/>
   <font size="-1"><a href="#LastLine">GoTo Last Line</a></font>
   
   <table border="0" cellspacing="1" cellpadding="3" style="font-family:Arial,helvetica,sans-serif;font-size=90%;">
     <tr style="background-color:#DDDDDD">
       <th align="center"> # </th><th align="center">Time</th><th align="left"> &#160; &#160; &#160; &#160; Driver Call</th><th align="left"> &#160; &#160;HRESULT</th>
     </tr>
    <xsl:for-each select="TraceRecords/Method">
      <tr style="background-color:#EEEEEE">
        <td align="right" valign="top">
          <xsl:value-of select='position()' />.
        </td>		
        <td valign="top">
          &#160;<xsl:value-of select="@StartTime"/>&#160;
        </td>		
        <td>
          &#160;<xsl:value-of select="@Interface"/>.<b>
            <xsl:value-of select="@Name"/>
          </b>(
          <xsl:for-each select="Parameter">
            [<xsl:value-of select="@Direction"/>] <xsl:value-of select="@Name"/>
            "<xsl:value-of select="@Value"/><xsl:for-each select="Element">
              <xsl:value-of select="@Value"/>
             <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>"<xsl:if test="position()!=last()">
              <xsl:text>,&#160;</xsl:text>
            </xsl:if>
          </xsl:for-each> )&#160;
        </td> 
		<td valign="top">
          <xsl:for-each select="HRESULT">
				&#160;<xsl:value-of select="@Value"/>
			    <xsl:text>&#160;&#160;</xsl:text>
				<font color="#FF0000">
					<xsl:value-of select="@Message"/>
				</font>
		  </xsl:for-each>
		</td>
		  
		</tr>
      <xsl:if test="@Name='Close' and position()!=last()">
        <tr style="background-color:#DDDDDD">
          <th align="center"> # </th><th align="center">Time</th><th align="center">Method</th>
        </tr>
      </xsl:if>

      <!-- Methods may call a child method -->
      <xsl:for-each select="Method">
       <tr style="background-color:#EEEEEE">
         <td colspan="2" style="background-color:#EEEEEE"></td>
         <td> &#160; &#160; <xsl:value-of select="@Interface"/>.<b><xsl:value-of select="@Name"/></b>(
         <xsl:for-each select="Parameter">
           [<xsl:value-of select="@Direction"/>] <xsl:value-of select="@Name"/>
          "<xsl:value-of select="@Value"/><xsl:for-each select="Element"><xsl:value-of select="@Value"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each>"<xsl:if test="position()!=last()"><xsl:text>,&#160;</xsl:text></xsl:if>
         </xsl:for-each> )&#160;
         </td>
		<td valign="top">
          <xsl:for-each select="HRESULT">
				&#160;<xsl:value-of select="@Value"/>
			    <xsl:text>&#160;&#160;</xsl:text>
				<font color="#FF0000">
					<xsl:value-of select="@Message"/>
				</font>
		  </xsl:for-each>
		</td>
       </tr>
      </xsl:for-each>
    </xsl:for-each>
   </table>
   
   <a name="LastLine"></a>
   <font size="-1"><a href="#FirstLine">GoTo First Line</a></font>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>