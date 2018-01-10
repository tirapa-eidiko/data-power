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
<head>
<script>
function loadDoc() {
console.log('IN load DOC');
var xhttp = new XMLHttpRequest();
var x = document.getElementById("RID").value;
var y = document.getElementById("SID").value; 
console.log('Y Value'+x);
console.log('X value'+y);

xhttp.open("GET", "http://192.168.2.161:2062?id="+x+"&amp;name="+y+"", true);
  xhttp.send();
}
</script>
<script>
function loadDoc1(obj) {
console.log('IN load DOC');
var i = obj.id;
console.log('ID'+i);
var xhttp = new XMLHttpRequest();


xhttp.open("GET", "http://192.168.2.161:2079?id="+i, true);
  xhttp.send();
}
</script>
</head>
		<body>
			<table border="1">
				<th>ROLLNO</th>
				<th>STDNAME</th>
				<th>DATE_TIME</th>
				<th>Delete</th>
				<xsl:for-each select="$data/sql/row">
				
				<xsl:variable name="id">
				<xsl:value-of select="column[name='ROLLNO']/value"/>
				</xsl:variable>
				<tr>
				<td> <xsl:value-of select="column[name='ROLLNO']/value"/> </td>
				<td> <xsl:value-of select="column[name='STDNAME']/value"/> </td>
				<td> <xsl:value-of select="date:date()"/> </td>
				<td>
				<button  onclick="loadDoc1(this)">
				<xsl:attribute name="id">
					<xsl:value-of select="column[name='ROLLNO']/value"/>
				</xsl:attribute>
				DELETE
				</button>
				</td>
				</tr>
				</xsl:for-each>
				<tr>
				<td><input type="text" id="RID"/></td>
				<td><input type="text" id="SID"/></td>
				<td><xsl:value-of select="date:date()"/></td>
				<td><button onclick="loadDoc()">ADD</button></td>
				</tr>		
			</table>



		</body>
	</html>


</xsl:template>

</xsl:stylesheet>

