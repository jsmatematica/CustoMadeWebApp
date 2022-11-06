<%-- 
    Document   : registroDeUsuario
    Created on : Oct 23, 2022, 3:37:57 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style> 
            input[type='submit']{
                visibility: hidden;
            }
            
            p{
                visibility: hidden;
            }
            #mensaje2{
                margin: 10vh auto;
                padding: 5vh;
                border: solid;
                border-radius: 10px;
                font-family: sans-serif;
                width: 50vw;
                height: 30vh;
            }
            #mensaje2 label{
                min-width: 80%;
                margin-left: 20%;
            }
            #mensaje2 label input{
                border: none;
            }
            #nombreDisp{
                display: inline;
            }
            #mensaje{
                display: inline;
                font-size: 80%;
                margin-left: 5px;
            }
        </style>
        <title>Registro de Usuario</title>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <div id="mensaje2">
        <form method="POST" action="registrarUsuario">
            <label>Nombre completo: <input type="text" name="nombre" required></label>
           <br>
           <label>C.I.: <input type="number" name="ci" required></label>
            <br>
            <label> Teléfono de contacto: <input type="text" name="tel" required></label>
           <br>
           <label>Dirección: <input type="text" name="dir" required></label>
            <br>
            <label>email: <input id="email" type="email" name="email" required><div id="nombreDisp"></div></label>
            <br>
            <label>Ingrese una contraseña: <input id="pass1" type="password" name="pass1" required></label>
            <br>
            <label>Ingrese nuevamente su contraseña: <input id="pass2" type="password" name="pass2" required><p id="mensaje">Las contraseñas no coinciden</p></label>
            <br>
            <input id="boton" type="submit" value="Registrarse">
        </form>
        </div>
        <script>
            document.getElementById('pass2').onkeyup = function(){
                if(document.getElementById('pass2').value != document.getElementById('pass1').value){
                    document.getElementById('mensaje').style.visibility = "visible";
                    document.getElementById('boton').style.visibility = "hidden";
                }else{
                    document.getElementById('mensaje').style.visibility = "hidden";
                    document.getElementById('boton').style.visibility = "visible";
                }
            }
            
            document.getElementById("email").onkeyup = function(){
                var emailVar = document.getElementById('email').value;
                $.post('usuarioDisponible',
                {
                    email : emailVar
                },function(responseText){
                    document.getElementById('nombreDisp').innerHTML = responseText;
                }        
        );
                
            }
            
        </script>
    </body>
</html>
