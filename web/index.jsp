<%-- 
    Document   : index
    Created on : Sep 30, 2022, 9:24:13 AM
    Author     : jsmat
--%>

<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% Conexion.getInstance();  %>
    </body>
</html>
