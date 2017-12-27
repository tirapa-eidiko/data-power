<!--

Question
How do I return multiple attributes from a single call to dp:ldap-search() with a DataPower SOA Appliance?

Answer
Use a comma separated list of attributes in the attributeName field. The sample below will return the user's SN,givenname and mail attributes.
-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" extension-element-prefixes="dp" exclude-result-prefixes="dp">
  <xsl:template match="/">
    <xsl:variable name="serverAddress" select="'192.168.3.190'"/>
    <xsl:variable name="portNumber" select="'10389'"/>
    <xsl:variable name="bindDN" select="'uid=admin,ou=system'"/>
    <xsl:variable name="bindPassword" select="'admin'"/>
    <xsl:variable name="targetBaseDN" select="'uid=admin,ou=system'"/>
    <xsl:variable name="attributeName" select="'uid,cn,dn'"/>
    <xsl:variable name="filter" select="'(|(CN=user1)(CN=user2)(CN=user3))'"/>
    <xsl:variable name="sslProxyProfile" select="''"/>
    <xsl:variable name="ldapLBGroup" select="''"/>

    <xsl:variable name="ldapResults" select="dp:ldap-search($serverAddress, $portNumber, $bindDN, $bindPassword, $targetBaseDN, $attributeName, $filter, 'sub', $sslProxyProfile, $ldapLBGroup)"/>

    <xsl:copy-of select="$ldapResults" />

  </xsl:template>
</xsl:stylesheet> 