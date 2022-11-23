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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <style> 
            
            
            #mensaje{
                margin: 10vh auto;
                text-align:  left;
                padding: 5vh;
                border: solid;
                border-radius: 10px;
                font-family: sans-serif;
                width: 50vw;
                height: 10vh;
                max-height: 90%;
            }
            #mensaje input{
                border: none;

            }
            #mensaje form{
                margin-left: 35%;
               font-size: 150%;
               max-height: 90%;
            }
        </style>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <div id="mensaje">
        <form action="iniciarSesion" method="POST">
            <label>Email: <input type="text" name="email" required></label>
            <br>
            <label>Contraseña: <input type="password" name="pass" required></label>
            <br>
            <input type="submit" value="Iniciar Sesión">
        </form>
        </div>
    </body>
</html>
