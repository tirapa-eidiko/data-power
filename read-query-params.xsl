<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">
<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:template match="/">
      <!--<xsl:variable name='fname'>
			<xsl:value-of select='//request/args/arg/[@name="fname"]'/>
		</xsl:variable>
		<xsl:variable name='id'>
			<xsl:value-of select='//request/args/arg/[@name='id']'/>
		</xsl:variable>
		<xsl:variable name='name'>
			<xsl:value-of select='//request/args/arg/[@name='name']'/>
		</xsl:variable>-->
		<xsl:for-each select="//request/args">
				
				<xsl:variable name="name">
				<xsl:attribute name="name">
					<xsl:value-of select="/arg/@name"/>
				</xsl:attribute>
				<xsl:value-of select="/arg"/>
				</xsl:variable>
				
</xsl:for-each>
		<output>
		<fname><xsl:value-of select="$fname"/></fname>
		<id><xsl:value-of select="$id"/></id>
		<name><xsl:value-of select="$name"/></name>
		</output>
</xsl:template>


</xsl:stylesheet>