<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" extension-element-prefixes="dp" exclude-result-prefixes="dp">
	<xsl:template match="/">
		<xsl:variable name='client_id'>
			<xsl:value-of select='//sql/row/column[name="CLIENT_ID"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='redirect_url'>
			<xsl:value-of select='//sql/row/column[name="REDIRECT_URL"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='scope'>
			<xsl:value-of select='//sql/row/column[name="SCOPE"]/value/text()'/>
		</xsl:variable>
		<xsl:variable name='authorizeurl'>
			<xsl:value-of select='//sql/row/column[name="AUTHORIZEURL"]/value/text()'/>
		</xsl:variable>
		<dp:set-variable name="'var://service/routing-url'" value="'http://192.168.3.104:9000'"/>
		<html>
			<head>
				<script>
					window.location="<xsl:value-of select='$authorizeurl'/>?response_type=code&amp;client_id=<xsl:value-of select='$client_id'/>&amp;redirect_uri="+encodeURIComponent("<xsl:value-of select='$redirect_url'/>")+"&amp;scope="+encodeURIComponent("<xsl:value-of select='$scope'/>")+"&amp;state=set_state_here";
				</script>
			</head>
			<body>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>









