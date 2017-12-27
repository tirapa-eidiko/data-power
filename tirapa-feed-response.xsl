<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:dp="http://www.datapower.com/extensions" version="1.0" extension-element-prefixes="dp " exclude-result-prefixes="dp">
   <xsl:output method="xml" encoding="utf-8" indent="yes" />
   <xsl:template match="/">
      <xsl:call-template name="createSoapFault">
         <xsl:with-param name="aFaultCode" select="$vErrorSet/error/faultcode" />
         <xsl:with-param name="aFaultString" select="$vErrorSet/error/faultstring" />
         <xsl:with-param name="aErrorCode" select="$vErrorSet/error/errorcode" />
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="createSoapFault">
      <atom:feed xmlns:atom="http://www.w3.org/2005/Atom" xmlns:date="http://exslt.org/dates-and-times" xmlns:dp="http://www.datapower.com/schemas/management" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
         <atom:id>atom.sample.com</atom:id>
         <atom:title>feed demo: List of Customers</atom:title>
         <atom:updated>2007-11-14T22:56:58+11:00</atom:updated>
         <atom:entry>
            <atom:id>0</atom:id>
            <atom:title>customer0</atom:title>
            <atom:updated>2007-11-14T22:56:58+11:00</atom:updated>
            <atom:content>
               <Customer xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                  <CustomerID>0</CustomerID>
                  <CustomerName>customer0</CustomerName>
               </Customer>
            </atom:content>
         </atom:entry>
      </atom:feed>
   </xsl:template>
</xsl:stylesheet>