<?xml version="1.0" encoding="utf-8"?>
<!--
+ |*********************************************************************************
|*** Author: ITSO
|*** file: itso.aaa-authorize.xsl
|*** Description: This XSL is responsible for AAA authorization. Data used are those transmitted
by the
|*** previous authentication step. Here is an example of the incoming XML content:
|*** <container>
|*** <mapped-credentials>
|*** <entry>
|*** <userid>...</userid>
|*** </entry>
|*** </mapped-credentials>
|*** </container>
|*** Revision : 1.0 : initial version
|*********************************************************************************
+ -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp"
exclude-result-prefixes="dp">
<!-- Import XSL stylesheet which provides debugging enhancements-->
<xsl:import href="local:///itso-common-debug.xsl"/>
<!--+
|*********************
|*** Matching Template
|*** Element: ROOT
|*********************
+ -->
<xsl:template match="/">
<xsl:apply-templates select="container"/>
</xsl:template>
<!--+
|**********************
|*** Matching Template
|*** Element: container
|**********************
+ -->
<xsl:template match="container">
<xsl:apply-templates select="mapped-credentials"/>
</xsl:template>
<!--+
|*******************************
|*** Matching Template
|*** Element: mapped-credentials
|*******************************
+ -->
Chapter 6. XSLT programming 139
<xsl:template match="mapped-credentials">
<xsl:apply-templates select="entry"/>
</xsl:template>
<!--+
|*********************
|*** Matching Template
|*** Element: entry
|*********************
+ -->
<xsl:template match="entry">
<!-- Get userid value -->
<xsl:variable name="vUserId" select="userid"/>
<!-- Get local name of the request element, that is the extracted resource -->
<xsl:variable name="vRequestName"
select="dp:variable('var://context/WSM/resource/extracted-resource')"/>
<!-- Perform authorization -->
<xsl:call-template name="authorize">
<xsl:with-param name="aUserId">
<xsl:value-of select="$vUserId"/>
</xsl:with-param>
<xsl:with-param name="aRequestName">
<xsl:value-of select="$vRequestName"/>
</xsl:with-param>
<xsl:with-param name="aDate">
<xsl:value-of select="dp:time-value()"/>
</xsl:with-param>
</xsl:call-template>
</xsl:template>
<!--+
|*********************
|*** Named Template
|*** name: authorize
|*********************
+ -->
<xsl:template name="authorize">
<xsl:param name="aUserId"/>
<xsl:param name="aRequestName"/>
<xsl:param name="aDate"/>
<!-- Define a variable for AAA repository XML file -->
<xsl:variable name="vAuthorizationFile" select="document('local:///AAA-repository.xml')"/>
<!-- Debug value of aRequestName parameter -->
<xsl:call-template name="debug">
<xsl:with-param name="aLabel">request name</xsl:with-param>
<xsl:with-param name="aMessage"><xsl:value-of select="$aRequestName"/></xsl:with-param>
</xsl:call-template>
<!-- Debug value of user id-->

<xsl:call-template name="debug">
<xsl:with-param name="aLabel">user id</xsl:with-param>
<xsl:with-param name="aMessage"><xsl:value-of select="$aUserId"/></xsl:with-param>
</xsl:call-template>
<xsl:choose>
<xsl:when test="$vAuthorizationFile != ''">
<!-- *** Step1 : get the start date from authorize/userid, if it exists ! *** -->
<xsl:variable name="vStartDate"
select="$vAuthorizationFile/aaa-data/authorize/request[@name=$aRequestName]/user[@id=string($aUs
erId)]/@start-date"/>
<!-- Debug value of vStartDate-->
<xsl:call-template name="debug">
<xsl:with-param name="aLabel">start-date</xsl:with-param>
<xsl:with-param name="aMessage"><xsl:value-of select="$vStartDate"/></xsl:with-param>
</xsl:call-template>
<xsl:choose>
<!-- *** Step2 : verify that current date is ok (above the service start date) *** -->
<xsl:when test="number($aDate) &gt; number($vStartDate)">
<!-- ***
If everything matches then we want to output <approved/>
to let the DataPower AAA framework know that authorization succeeded.
*** -->
<approved/>
</xsl:when>
<!-- Add specific error handling in xsl:otherwise condition -->
<xsl:otherwise>
<declined/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<!-- Add specific error handling in xsl:otherwise condition -->
<xsl:otherwise>
<declined/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>