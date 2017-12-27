<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">

<xsl:template match="/*[local-name()='Envelope']/*[local-name()='Body']/*[1]">

	<xsl:variable name="vServiceUrl">
		<xsl:call-template name="getUrl">
			<xsl:with-param name="aRequestName" select="local-name()"/>
		</xsl:call-template>
	</xsl:variable>

	<dp:set-variable name="'var://context/txn-info/dynamic-route'" value="string($vServiceUrl)"/>
</xsl:template>

<xsl:template name="getUrl">
	<xsl:param name="aRequestName"/>
	
	<xsl:variable name="vSqlQuery">SELECT SERVICE_URL FROM cs.ROUTE WHERE REQUEST_NAME='<xsl:value-of select="$aRequestName"/>'
	</xsl:variable>

	<xsl:variable name="vDB2Return" select="dp:sql-execute('TIRAPA',$vSqlQuery)"/>
	
	<xsl:message dp:priority="error">
		<xsl:value-of select="concat('DB2Return :',$vDB2Return)"/>
	</xsl:message>

	<xsl:value-of select="$vDB2Return/sql/row/column/value"/>
</xsl:template>
</xsl:stylesheet>