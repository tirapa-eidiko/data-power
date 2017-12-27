<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">


<xsl:template match="/">
      <xsl:call-template name="generateTable">
      </xsl:call-template>
</xsl:template>

<xsl:template name="generateTable">
	<xsl:variable name="query">SELECT SERVICE_URL,REQUEST_NAME FROM cs.ROUTE</xsl:variable>

	<xsl:variable name="data" select="dp:sql-execute('TIRAPA',$query)"/>

	<html>
		<body>
			<table border="1">
				<th>REQUEST_NAME</th>
				<th>SERVICE_URL</th>
				<th>DATE_TIME</th>
				<xsl:for-each select="$data/sql/row">
				<tr>
				<td> <xsl:value-of select="column[name='REQUEST_NAME']/value"/> </td>
				<td> <xsl:value-of select="column[name='SERVICE_URL']/value"/> </td>
				<td> <xsl:value-of select="date:date()"/> </td>
				</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>

</xsl:template>

</xsl:stylesheet>

