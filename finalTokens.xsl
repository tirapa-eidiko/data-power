<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:str="http://exslt.org/strings"
   xmlns:dp="http://www.datapower.com/extensions"
   extension-element-prefixes="dp"
   exclude-result-prefixes="dp"
   version="1.0">
   <xsl:output method="xml"/>
   <xsl:variable name="at">
      <xsl:value-of select="//xml/access_token"/>
   </xsl:variable>
<xsl:variable name="rt">
      <xsl:value-of select="//xml/refresh_token"/>
   </xsl:variable>
   <xsl:template match="/">

       <output> 
       <rt> <xsl:value-of select="$rt"/></re>
       <at> <xsl:value-of select="$at"/></at>
      </output>
 
   </xsl:template>
</xsl:stylesheet>