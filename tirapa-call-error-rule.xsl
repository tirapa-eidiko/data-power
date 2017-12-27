<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">
<xsl:template match="/">
<xsl:variable name="dbServiceURL" select="dp:variable('var://context/txn-info/dynamic-route')"/>

<xsl:message dp:priority="error">
		<xsl:value-of select="concat('DBServiceURL :',$dbServiceURL)"/>
</xsl:message>

<xsl:choose>
	<xsl:when test="$dbServiceURL != ''">
	    
		<approved/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:variable name="errorSet">
			<error>
			<faultcode>Client error</faultcode>
			<faultstring>invalid Method</faultstring>
			<errorcode>Check the method you are trying to call</errorcode>
			</error>
		</xsl:variable>
		<dp:set-variable name="'var://context/itso/error-set'" value="$errorSet"/>
		<dp:reject/>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>




</xsl:stylesheet>