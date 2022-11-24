<%-- 
    Document   : cerrarSesion
    Created on : Oct 23, 2022, 9:13:26 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar Sesion</title>
        <style> 
            #mensaje{
                margin: 5vh auto;
                
                border-radius: 10px;
                text-align: center;
                padding: 2vw;
                 font-family: 'Oswald' ,sans-serif;
                width: 50vw;
                height: 10vh;
            }
            .cerrar{
                 font-family: 'Oswald' ,sans-serif;
            }
            .volver{
                text-decoration: none;
                color: white;
                background: black;
                    padding: 0.5%; 
                     text-transform: uppercase;
              border-radius: 5%;       
                     font-size: 0.9vw;
            }
            .volver:hover{
             background-color: white;
             border: solid;
             color: black;
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

        <%
        sesion.invalidate();
        %>
        <div id="mensaje">
        <h2 class="cerrar">
            Se ha cerrado su sesión de usuario
        </h2>
        <a class="volver" href='index.jsp'>Volver al inicio</a>
        </div>
 <div class="footer">&copy;<span id="year"> </span><span> CUSTOMADE. All rights reserved.</span></div>
    </body>
</html>
