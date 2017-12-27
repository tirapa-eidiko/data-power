<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" extension-element-prefixes="dp" exclude-result-prefixes="dp">
	<xsl:template match="/">
		<xsl:variable name="code1" select="dp:variable('var://service/URL-in')"/>
		<xsl:variable name="code" select="substring-after($code1,'code=')"/>
		<xsl:variable name='client_id'>
			<xsl:value-of select='//sql/row/column[name="CLIENT_ID"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='redirect_url'>
			<xsl:value-of select='//sql/row/column[name="REDIRECT_URL"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='scope'>
			<xsl:value-of select='//sql/row/column[name="SCOPE"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='client_secret'>
			<xsl:value-of select='//sql/row/column[name="CLIENT_SECRET"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name="tokenurl">
			<xsl:value-of select="concat('https://api.ciscospark.com/v1/access_token?grant_type=authorization_code&amp;client_id=',$client_id,'&amp;client_secret=',$client_secret,'&amp;redirect_uri=',$redirect_url,'&amp;code=',$code)"/>
		</xsl:variable>
		<dp:set-variable name="'var://service/routing-url'" value="$tokenurl"/>
		<xsl:copy-of select="/"/>
	</xsl:template>
</xsl:stylesheet>


