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
    </head>
    <body>
        <form action="iniciarSesion" method="POST">
            Email: <input type="text" name="email" required><br>
            Contraseña: <input type="password" name="pass" required><br>
            <input type="submit" value="Iniciar Sesión">
        </form>
    </body>
</html>
