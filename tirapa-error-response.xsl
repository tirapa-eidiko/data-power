<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
	     <xsl:variable name="vErrorSet" select="dp:variable('var://context/itso/error-set')"/>
		<!--xsl:value-of select="dp:variable('var://context/itso/error-set')"/>-->
		
	<xsl:call-template name="createSoapFault">
		<xsl:with-param name="aFaultCode" select="$vErrorSet/error/faultcode"/>
		<xsl:with-param name="aFaultString" select="$vErrorSet/error/faultstring"/>
		<xsl:with-param name="aErrorCode" select="$vErrorSet/error/errorcode"/>
		</xsl:call-template>
	</xsl:template>
	
	
	<xsl:template name="createSoapFault">
	<xsl:param name="aFaultCode"/>
	<xsl:param name="aFaultString"/>
	<xsl:param name="aErrorCode"/>
	<SOAP-ENV:Envelope>
		<SOAP-ENV:Header/>
		<SOAP-ENV:Body>
		<SOAP-ENV:Fault>
		<faultcode><xsl:value-of select="$aFaultCode"/></faultcode>
		<faultstring><xsl:value-of select="$aFaultString"/></faultstring>
		<detail>
		<errorcode><xsl:value-of select="$aErrorCode"/></errorcode>
		</detail>
		</SOAP-ENV:Fault>
		</SOAP-ENV:Body>
	</SOAP-ENV:Envelope>
	</xsl:template>

</xsl:stylesheet>