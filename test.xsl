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


<xsl:variable name="URI" select="substring-after(dp:variable('var://service/URI'),'/?')"/>

<xsl:variable name="name">
	<xsl:value-of select="substring-after($URI, 'name=')"/>
</xsl:variable>




<dp:set-variable name="'var://context/txn-info/name'" value="$name"/>


<xsl:choose>
  <xsl:when test="not(string(substring-before($name, '&amp;')))">
    
  </xsl:when>
  <xsl:otherwise>
    <xsl:variable name="name">
		<xsl:value-of select="substring-before($name, '&amp;')"/>
	</xsl:variable>
	<dp:set-variable name="'var://context/txn-info/name'" value="$name"/>
	<xsl:message dp:priority="error">
		<xsl:value-of select="concat('SUSS Name:',$name)"/>
</xsl:message>
  </xsl:otherwise>
</xsl:choose>

<dp:set-variable name="'var://context/txn-info/id'" value="$id"/>
<xsl:variable name="id">
	<xsl:value-of select="substring-after($URI, 'id=')"/>
</xsl:variable>
<dp:set-variable name="'var://context/txn-info/id'" value="$id"/>

<xsl:choose>
  <xsl:when test="not(string(substring-before($id, '&amp;')))">
    
  </xsl:when>
  <xsl:otherwise>
    <xsl:variable name="id">
		<xsl:value-of select="substring-before($id, '&amp;')"/>
	</xsl:variable>
	<dp:set-variable name="'var://context/txn-info/id'" value="$id"/>
	<xsl:message dp:priority="error">
		<xsl:value-of select="concat('SUSS ID:',$id)"/>
	</xsl:message>
  </xsl:otherwise>
</xsl:choose>




<xsl:message dp:priority="error">
		<xsl:value-of select="dp:variable('var://context/txn-info/name')"/>
</xsl:message>
<xsl:message dp:priority="error">
		<xsl:value-of select="dp:variable('var://context/txn-info/id')"/>
</xsl:message>

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
			<p>Name: <xsl:value-of select="dp:variable('var://context/txn-info/name')"/></p>
			<p>ID : <xsl:value-of select="dp:variable('var://context/txn-info/id')"/></p>


		</body>
	</html>

</xsl:template>

</xsl:stylesheet>