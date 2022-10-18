<%-- 
    Document   : pruebaCrearArticulos
    Created on : Sep 30, 2022, 8:47:27 AM
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
    <ul>
        <li>Stock: <input type="number" id="stock"></li>
        <li>Precio: <input type="number" id="precio"</li>
        <li>Talle: <input type="text" id="talle"></li>
        <li>
            <!-- BUZOHOMBRE,BUZOMUJER,CAMPERAHOMBRE,CAMPERAMUJER,CAMISETAHOMBRE,CAMISETAMUJER,TAZA  -->
           Tipo:  <select id="tipo">
                <option value="BUZOHOMBRE">Buzo de hombre</option>
                <option value="BUZOMUJER">Buzo de mujer</option>
                <option value="CAMPERAHOMBRE">Campera de hombre</option>
                <option value="CAMPERAMUJER">Campera de mujer</option>
                <option value="CAMISETAHOMBRE">Camiseta de hombre</option>
                <option value="CAMISETAMUJER">Camiseta de mujer</option>
                <option value="TAZA">Taza</option>
            </select>
        </li>
        <li>Color: <input type="text" id="color"></li>

    </ul>

    
    
    
    <button onclick="enviar()">
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





function enviar() {
	var img = document.getElementById('imagen').src;
        var tipoVar = document.getElementById('tipo').value;
        var stockVar = document.getElementById('stock').value;
        var precioVar = document.getElementById('precio').value;
        var colorVar = document.getElementById('color').value;
        var talleVar = document.getElementById('talle').value;
$.post('pruebaCrearArticulos', {
				base64 : img,
                                tipo : tipoVar,
                                stock : stockVar,
                                precio : precioVar,
                                color : colorVar,
                                talle : talleVar
			}, function(responseText) {
				document.getElementById('resp2').innerHTML = responseText;
			});


}

</script>
</html>
