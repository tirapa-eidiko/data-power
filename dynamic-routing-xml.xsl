<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp"
exclude-result-prefixes="dp">


<xsl:template match="/*[local-name()='Envelope']/*[local-name()='Body']/*[1]">
	
	<xsl:variable name="vServiceUrl">
		<xsl:call-template name="getUrl">
		<xsl:with-param name="aRequestName" select="local-name()"/>
		</xsl:call-template>
	</xsl:variable>
	
	<xsl:message dp:priority="error">
		<xsl:value-of select="concat('Service-URL :',$vServiceUrl)"/>
	</xsl:message>
	
	<dp:set-variable name="'var://context/txn-info/dynamic-route'" value="string($vServiceUrl)"/>
</xsl:template>

<xsl:template name="getUrl">
	<xsl:param name="aRequestName"/>
	
	<xsl:variable name="vFile" select="document('local:///routes.xml')"/>
	
	<xsl:variable name="vServiceUrl"
	select="$vFile/routes/route[@request-name=$aRequestName]/@service-url"/>
	
	<xsl:value-of select="$vServiceUrl"/>
</xsl:template>

</xsl:stylesheet>