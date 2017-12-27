<?xml version="1.0" encoding="utf-8"?>
<!--
+
|*********************************************************************************
|*** Author: ITSO
|*** file: itso.aaa-extract_info.xsl
|*** Description: This XSL is responsible for extracting AAA information from the incoming
message
|*** Revision : 1.0 : initial version
|*********************************************************************************
+ -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
xmlns:itso="http://com.itso"
extension-element-prefixes="dp "
exclude-result-prefixes="dp itso">
<!-- +
|********************************************************************
|*** Matching Template
|*** Element: /*[local-name()='Envelope']/*[local-name()='Body']/*[1]
|********************************************************************
+ -->
<!-- Match the first element contained in the body of the soap message
Input soap message has already been validated when this matching is processed
-->
<xsl:template match="/*[local-name()='Envelope']/*[local-name()='Body']/*[1]">
<!-- Get value of the HTTP header field XClient-IP -->
<xsl:variable name="vClientIP" select="dp:http-request-header('X-Client-IP')"/>
<!-- Get local name of the current service request and store it in DP transaction -->
<xsl:variable name="vRequestName" select="local-name()"/>
<dp:set-variable name="'var://context/txn-info/requestName'" value="string($vRequestName)"/>
<!-- ***
Here we build the output of the identity extraction.
Next step is authentication, that is going to use these data to perform user authentication
***
-->
<user>
<!-- Get value of Username element contained in SOAP header's WS-Security token -->
<xsl:value-of
select="/*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='Security']/*[localname()='
UsernameToken']/*[local-name()='Username']"/>
</user>
<password>
<!-- Get value of Password element contained in SOAP header's WS-Security token -->
<xsl:value-of
select="/*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='Security']/*[localname()='
UsernameToken']/*[local-name()='Password']"/>
</password>
<clientIP>
<xsl:value-of select="$vClientIP"/>
</clientIP>
</xsl:template>
</xsl:stylesheet>