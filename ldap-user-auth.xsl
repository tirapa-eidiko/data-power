<xsl:variable name="ldap_filter" disable-output-escaping="yes">
  <xsl:value-of select="concat('uid=',$aUser,',ou=people,o=company.com')" />
</xsl:variable>
<xsl:variable name="ldap-authen-result" 
  select="dp:ldap-authen($ldap_filter, $aPassword, 
  concat('myldapserver', ':', '389'), '', '')" />
<xsl:choose>
  <xsl:when test="$ldap-authen-result">
    <userid>
      <xsl:value-of select="$aUser"/>
    </userid>
  </xsl:when>
  <xsl:otherwise/>
</xsl:choose>