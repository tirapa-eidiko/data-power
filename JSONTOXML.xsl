<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx" version="2.0" exclude-result-prefixes="json">
<xsl:template match="/json:object">
<xsl:apply-templates/>
</xsl:template>
<xsl:template match="json:array[@name]">
<xsl:element name="{@name}">
<xsl:apply-templates/>
</xsl:element>
</xsl:template>
<xsl:template match="json:object">
<xsl:element name="{../@name}">
<xsl:apply-templates/>
</xsl:element>
</xsl:template>
<xsl:template match="json:object[@name]">
<xsl:element name="{@name}">
<xsl:apply-templates/>
</xsl:element>
</xsl:template>
<xsl:template match="json:string[@name]">
<xsl:element name="{@name}">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="json:number[@name]">
<xsl:element name="{@name}">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="json:boolean[@name]">
<xsl:element name="{@name}">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="json:null[@name]">
<xsl:element name="{@name}">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
</xsl:stylesheet>