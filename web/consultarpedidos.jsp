<%-- 
    Document   : consultarpedidos
    Created on : Nov 6, 2022, 6:47:45 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Pedidos</title>
        <style>
            #cuadroDeBusqueda{
                border: solid;
                border-radius: 10px;
                margin: 15vh auto;
                width: 50vh;
                height: 10vh;
                padding: 5%;
                padding-left: 10%;
                font-family: sans-serif;
            }
            
            table{
                border: solid;
                border-radius: 10px;
                margin: 10vh auto;
                padding: 5px;
                width: 50vw;
                text-align: center;
                font-family: sans-serif;

            }
        </style>
    </head>
    <body>
        <script src="http://code.jquery.com/jquery-latest.js">
</script>
        <%@include file="barraNav.jsp" %>
        <div id="cuadroDeBusqueda">
            <label>
                Ingrese su número de cédula:
                <input type='number' id='ci' placeholder="12345678" required>
            </label>
            <button id='boton'>Buscar</button>
        </div>
        <div id='respuesta'></div>
    </body>
    <script>
        document.getElementById("boton").onclick = function(){
            var ciVar = document.getElementById('ci').value;
            $.post('getPedidosByCi',
            {
                ci : ciVar
            },function(responseText){
                document.getElementById('respuesta').innerHTML = responseText;
            }  
        );
            
        }
    </script>
</html>
