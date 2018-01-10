<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">
<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:template match="/">
      <xsl:variable name='username'>
			<xsl:value-of select='//identity/entry/username'/>
		</xsl:variable>
		<xsl:variable name='password'>
			<xsl:value-of select='//identity/entry/password'/>
		</xsl:variable>
		<userid><xsl:value-of select="$username"/></userid>
</xsl:template>




</xsl:stylesheet>
