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
        </style>
        <title>Registro de Usuario</title>
    </head>
    <body>
        <form method="POST" action="registrarUsuario">
            Nombre completo: <input type="text" name="nombre" required><br>
            C.I.: <input type="number" name="ci" required><br>
            Teléfono de contacto: <input type="text" name="tel" required><br>
            DIrección: <input type="text" name="dir" required><br>
            email: <input id="email" type="email" name="email" required><div id="nombreDisp"></div><br>
            Ingrese una contraseña: <input id="pass1" type="password" name="pass1" required><br>
            Ingrese nuevamente su contraseña: <input id="pass2" type="password" name="pass2" required><p id="mensaje">Las contraseñas no coinciden</p><br>
            <input id="boton" type="submit" value="Registrarse">
        </form>
        
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
