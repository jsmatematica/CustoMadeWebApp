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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        %>
        <h2>
            Se ha cerrado su sesión de usuario
        </h2>
        <a href='index.jsp'>Volver al inicio</a>
    </body>
</html>
