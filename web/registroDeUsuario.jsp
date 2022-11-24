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
 <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style> 
            input[type='submit']{
                visibility: hidden;
                color: black;
                background-color: white;
                font-family: 'Oswald' ,sans-serif;
                font-size: 20px;
                margin-left: 35%;
            }
            
            p{
                visibility: hidden;
            }
            #mensaje2{
                 margin: 10vh auto;
                border: solid;
                border-radius: 10px;
/*                height: 50vh;*/
                background-color: black;
                color: white;
                font-family: 'Oswald' ,sans-serif;
                height: 43vh;
            }
            .registro {
                font-family: 'Oswald' ,sans-serif;
                 color: white;
                font-size: 40px;
                font-weight: 600;
            }
            #form{
                margin-left: 35%;
                               border-radius: 20px;
                 padding: 20px;
                 width: 60vh;
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
            .labelcito{
                margin-top: 1%;
                margin-bottom: 1%;
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
        <title>Registro de Usuario</title>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <div id="mensaje2">
        <form id="form" method="POST" action="registrarUsuario">
             <label class="registro">Registrarse</label>
             <br>
            <label class="labelcito">Nombre completo: <input class="labelcito" type="text" name="nombre" required></label>
           <br>
           <label class="labelcito">C.I.: <input class="labelcito" type="number" name="ci" required></label>
            <br>
            <label class="labelcito"> Teléfono de contacto: <input type="text" name="tel" required></label>
           <br>
           <label class="labelcito">Dirección: <input class="labelcito" type="text" name="dir" required></label>
            <br>
            <label class="labelcito">email: <input class="labelcito" id="email" type="email" name="email" required><div id="nombreDisp"></div></label>
            <br>
            <label  class="labelcito">Ingrese una contraseña: <input class="labelcito" id="pass1" type="password" name="pass1" required></label>
            <br>
            <label class="labelcito">Ingrese nuevamente su contraseña: <input class="labelcito" id="pass2" type="password" name="pass2" required><p id="mensaje">Las contraseñas no coinciden</p></label>
            <br>
            <input id="boton" type="submit" value="Registrarse">
        </form>
        </div>
        <div class="footer">&copy;<span id="year"> </span><span> CUSTOMADE. All rights reserved.</span></div>
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
