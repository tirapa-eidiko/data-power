<html>

<body>
<div id='integratDiv'>
<a href="http://192.168.3.104:4001/code"><input type='button' value='Spark OAuth Dance' id='sparkbtn'/></a><br/>
<select id='integration'>
	<option value='0'>Select</option>
	<option value='bitbucket'>Bitbucket</option>
</select>
<input type='button' value='Integrate' id='integrate' onclick='integrate()'/>
</div>
<input type='button' value='close' onclick="closeFunction()" id='closewin'/>


</body>

<head>
<script>
document.getElementById('closewin').style.display="none";
var url = window.location.href;
if(url.indexOf("userid")>-1){
	document.getElementById('sparkbtn').disabled = true;
	document.getElementById('integration').disabled = false;
}else if(url.indexOf("result")>-1){
	document.getElementById('integratDiv').style.display="none";
	document.getElementById('closewin').style.display="block";
	window.close();
}else{
	document.getElementById('sparkbtn').disabled = false;
	document.getElementById('integration').disabled = true;
	document.getElementById('integrate').disabled = true;
}
function integrate(){
	var integration = document.getElementById('integration').value;
	if(integration != 0){
		var userid = url.substring(url.indexOf("userid=")+7);
		window.location.href = "http://192.168.3.104:4002/code?userid="+userid;
	}
}
function closeFunction(){
	window.close();
}
</script>
</head>
</html>
