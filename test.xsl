<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">


<xsl:template match="/">
      <xsl:call-template name="generateTable">
      </xsl:call-template>
</xsl:template>

<xsl:template name="generateTable">
	<xsl:variable name="query">SELECT ROLLNO,STDNAME FROM DB2INST1.STUDENT</xsl:variable>
        
	<xsl:variable name="data" select="dp:sql-execute('saitejadb',$query)"/>

 <html>
 <script>
function loadDoc() {
console.log('IN load DOC');
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function(test) {
   
  };
  xhttp.open("GET", "https://61e7ce76.ngrok.io/?fname%3DHenry%26lname%3DFord", true);
  xhttp.send();
}
</script>
		<body>
			<table border="1">
				<th>ROLLNO</th>
				<th>STDNAME</th>
				<th>DATE_TIME</th>
<th>Delete</th>
				<xsl:for-each select="$data/sql/row">
				<tr>
				<td> <xsl:value-of select="column[name='ROLLNO']/value"/> </td>
				<td> <xsl:value-of select="column[name='STDNAME']/value"/> </td>
				<td> <xsl:value-of select="date:date()"/> </td>
<td><button type="submit">Delete</button></td>
				</tr>
				</xsl:for-each>
<tr>
<td><input type="text" id="RID"/></td>
<td><input type="text" id="SID"/></td>
<td><xsl:value-of select="date:date()"/></td>
<td><button onclick="myFunction()">ADD</button></td>
</tr>		
</table>


		</body>
	</html>


</xsl:template>

</xsl:stylesheet>
