<%-- 
    Document   : iniciodesesion
    Created on : Oct 23, 2022, 4:53:02 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*" session='true'%>

<!DOCTYPE html>
<html>
    <head>
         <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <style> 
            
            
            #mensaje{
                margin: 10vh auto;
                border: solid;
                border-radius: 10px;
/*                height: 50vh;*/
                background-color: black;
                color: white;
                font-family: 'Oswald' ,sans-serif;
                
            }
            #mensaje input{
              
                font-family: 'Oswald' ,sans-serif;
                 font-size: 16px;
            }
            #mensaje form{
                margin-left: 35%;
               height: 40%;
                border-radius: 20px;
                 padding: 20px;
                 width: 40vh;
            }
            .title {
                font-family: 'Oswald' ,sans-serif;
                 color: white;
                 margin-top: 5%;
                font-size: 40px;
                font-weight: 600;
                margin-bottom: 5%;
 
                }
                .contra{
                 
                  margin-bottom: 10%;
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
        <%@include file="barraNav.jsp" %>
        <div id="mensaje">
        <form id="form" action="iniciarSesion" method="POST">
            <div class="title">Bienvenido</div>
            <label class="contra" id="mail">Email: <input class="contra" type="text" name="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required></label>
            <br>
            <label class="contra">Contraseña: <input class="contra" type="password" name="pass" required></label>
            <br>
            <input type="submit" value="Iniciar Sesión">
        </form>
        </div>
        <div class="footer">&copy;<span id="year"> </span><span> CUSTOMADE. All rights reserved.</span></div>
    </body>
</html>
