<?xml version="1.0" encoding="utf-8"?>
<!--
+
|*********************************************************************************
|*** Author: ITSO
|*** file: itso-common-debug.xsl
|*** Description: This XSL creates a DataPower debug message with error level, visible in probes
or system logs
|*** Import this stylesheet to use the 'debug' named template in your custom template
|*** Revision : 1.0 : initial version
|*********************************************************************************
+ -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">
<!-- +
|******************
|*** Named Template
|*** Name: debug
|******************
+ -->
<xsl:template name="debug">
<xsl:param name="aLabel"/>
<xsl:param name="aMessage"/>
<xsl:message dp:priority="error">
<xsl:if test="string($aLabel)!=''">
<xsl:value-of select="concat('*** ITSO-debug | ',$aLabel,':',$aMessage,'***')"/>
</xsl:if>
</xsl:message>
</xsl:template>
</xsl:stylesheet>