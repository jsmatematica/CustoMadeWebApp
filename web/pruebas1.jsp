<%-- 
    Document   : pruebas1
    Created on : Sep 29, 2022, 7:01:54 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <input type="file" name="" id="fileId" 
        onchange="Uploaded()">
    <br><br>
    <button onclick="display()">
        Subir Articulo
    </button>

<div id="resp"></div>
<div id="resp2"></div>
</body>




<script src="http://code.jquery.com/jquery-latest.js">
</script>

<script>

var base64String = "";
function Uploaded() {
	var file = document.querySelector(
		'input[type=file]')['files'][0];
	var reader = new FileReader();
	reader.onload = function () {
		base64String = reader.result.replace("data:", "")
			.replace(/^.+,/, "");
		imageBase64Stringsep = base64String;
document.getElementById("resp").innerHTML="<img src='data:image/png;base64,"+base64String+"' alt='un pato' id='imagen' width=50%>";
	}

	reader.readAsDataURL(file);
}





function display() {
	var enviar = document.getElementById('imagen').src;

$.post('subirArticuloPrueba', {
				base64 : enviar
			}, function(responseText) {
				document.getElementById('resp2').innerHTML = responseText;
			});


}

</script>
</html>
