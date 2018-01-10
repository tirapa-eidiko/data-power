<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">

<xsl:template match="/">
<html>

<body>
<div id='sendDev' align="center">
<select id='room'>

<option value='0'>Select</option>
<xsl:for-each select="//output/items/items">
				<option>
				<xsl:attribute name="value">
					<xsl:value-of select="id"/>
				</xsl:attribute>
				
				<xsl:value-of select="title"/>
				
				</option>
				
				
</xsl:for-each>
	
</select><br/>
<textarea id="testData" rows="9" cols="50" >
Write something to send a message.
</textarea><br/>
<input type='button' value='Send Message' id='send' onclick='sendMessage()'/>

</div>



</body>

</html>

</xsl:template>

</xsl:stylesheet>
