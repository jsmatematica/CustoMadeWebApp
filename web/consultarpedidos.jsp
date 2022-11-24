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
                margin: 15vh auto;
               font-family: 'Oswald' ,sans-serif;
               color: white;
               background-color: black;
                width: 50%;
                text-align: center;
                margin-top: 8vh;
                padding: 3vh;
            }
            
            table{
                border: solid;
                border-radius: 10px;
                margin: 10vh auto;
                padding: 5px;
                width: 50vw;
                text-align: center;
                font-family: 'Oswald' ,sans-serif;

            }
            .footer {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 2rem;
  background: black;
  color: white;
  font-weight: 500;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 0.2rem;
  font-family: 'Oswald' ,sans-serif;
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
        <div class="footer">&copy;<span id="year"> </span><span> CUSTOMADE. All rights reserved.</span></div>
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
