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
                border: solid;
                border-radius: 10px;
                text-align: center;
                padding: 2vw;
                font-family: sans-serif;
                width: 50vw;
                height: 10vh;
            }
        </style>
    </head>
    <body>
                <%@include file="barraNav.jsp" %>

        <%
        sesion.invalidate();
        %>
        <div id="mensaje">
        <h2>
            Se ha cerrado su sesión de usuario
        </h2>
        <a href='index.jsp'>Volver al inicio</a>
        </div>

    </body>
</html>
