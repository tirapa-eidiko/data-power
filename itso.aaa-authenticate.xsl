<?xml version="1.0" encoding="utf-8"?>
<!--
+ |*********************************************************************************
|*** Author: ITSO
|*** file: itso.aaa-authenticate.xsl
|*** Description: This XSL is responsible for authentication. Data used are those transmitted by
the
|*** identity extraction step. Here is an example of the incoming XML content:
|*** <identity>
|*** <entry type='custom'>
|*** <user>...</user>
|*** <password>...</password>
|*** <clientIP>...</clientIP>
|*** </entry>
|*** </identity>
|*** Revision : 1.0 : initial version
|*********************************************************************************
+ -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
xmlns:itso="http://com.itso"
extension-element-prefixes="dp"
exclude-result-prefixes="dp itso">
<!-- Import XSL stylesheet which provides debugging enhancements-->
<xsl:import href="local:///itso-common-debug.xsl"/>
<!--+
|*********************
|*** Matching Template
|*** Element: ROOT
|*********************
+ -->
<xsl:template match="/">
<xsl:apply-templates select="identity"/>
</xsl:template>
<!--+
|*********************
|*** Matching Template
|*** Element: identity
|*********************
+ -->
<xsl:template match="identity">
<xsl:apply-templates select="entry"/>
</xsl:template>
<!--+
|*********************
|*** Matching Template
|*** Element: entry
|*********************
Chapter 6. XSLT programming 135
+ -->
<xsl:template match="entry[@type='custom']">
<!-- Get login value -->
<xsl:variable name="vUser" select="user"/>
<!-- Get password value -->
<xsl:variable name="vPassword" select="password"/>
<!-- Get client-IP value -->
<xsl:variable name="vClientIP" select="clientIP"/>
<!-- Call the 'authenticate' named template that performs the authentication step -->
<xsl:call-template name="authenticate">
<xsl:with-param name="aUser">
<xsl:value-of select="$vUser"/>
</xsl:with-param>
<xsl:with-param name="aPassword">
<xsl:value-of select="$vPassword"/>
</xsl:with-param>
<xsl:with-param name="aClientIP">
<xsl:value-of select="$vClientIP"/>
</xsl:with-param>
</xsl:call-template>
</xsl:template>
<!--+
|************************
|*** Named Template
|*** Name: authenticate
|************************
+ -->
<!-- Verify authentication for a specific {user,password,clientIP} triplet -->
<xsl:template name="authenticate">
<xsl:param name="aUser"/>
<xsl:param name="aPassword"/>
<xsl:param name="aClientIP"/>
<!-- define a variable for AAA repository XML file -->
<xsl:variable name="vAuthenticationFile" select="document('local:///AAA-repository.xml')"/>
<!-- Here we perform authentication -->
<xsl:choose>
<xsl:when test="$vAuthenticationFile != ''">
<xsl:variable name="vUserID"
select="$vAuthenticationFile/aaa-data/authenticate[string(user)=$aUser][string(password)=$aPassw
ord][contains(string(client-ip),$aClientIP)]/user/@id"/>
<!-- ***
If credentials match then we want to output something to let the AAA framework know that
authentication succeeded.
If credentials do not match, we output nothing and that means 'authentication failure' to
the AAA framework.
*** -->
<!-- Debug value of vUserID-->
<xsl:call-template name="debug">
<xsl:with-param name="aLabel">userid</xsl:with-param>
<xsl:with-param name="aMessage"><xsl:value-of select="$vUserID"/></xsl:with-param>
</xsl:call-template>
<xsl:choose>
<xsl:when test="string($vUserID) != ''">
<userid>
<xsl:value-of select="$vUserID"/>
</userid>
</xsl:when>
<!-- Add error handling in xsl:otherwise condition-->
<xsl:otherwise/>
</xsl:choose>
</xsl:when>
<!-- Add error handling in xsl:otherwise condition-->
<xsl:otherwise/>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>