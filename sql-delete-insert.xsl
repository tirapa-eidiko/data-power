<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx" extension-element-prefixes="dp">
	<xsl:template match="/">
		<xsl:variable name="accesstoken">
			<xsl:value-of select="dp:variable('var://context/INPUT/accesstoken')"/>
		</xsl:variable>
		<xsl:variable name="accesstoken_expiry">
			<xsl:value-of select="dp:variable('var://context/INPUT/accesstoken_expiry')"/>
		</xsl:variable>
		<xsl:variable name="refreshtoken">
			<xsl:value-of select="dp:variable('var://context/INPUT/refreshtoken')"/>
		</xsl:variable>
		<xsl:variable name="userid">
			<xsl:value-of select="dp:variable('var://context/INPUT/userid')"/>
		</xsl:variable>
<xsl:variable name="query1">delete from cs.tokendetails where user_id='<xsl:value-of select='$userid'/>' and appname='basecamp'</xsl:variable>
<dp:sql-execute source="'TIRAPA'" statement="$query1"/>

<dp:sql-execute source="'TIRAPA'" statement="$query"/>
		<xsl:variable name="query">insert into cs.tokendetails values('<xsl:value-of select='$userid'/>','<xsl:value-of select='$accesstoken'/>','<xsl:value-of select='$refreshtoken'/>','<xsl:value-of select='$accesstoken_expiry'/>','0','basecamp')</xsl:variable>

		<dp:sql-execute source="'TIRAPA'" statement="$query"/>
	</xsl:template>
</xsl:stylesheet> 

