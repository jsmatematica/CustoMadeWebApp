<%-- 
    Document   : pruebas2
    Created on : Sep 29, 2022, 8:30:09 PM
    Author     : jsmat
--%>

<%@page import="java.util.Base64"%>
<%@page import="customade2.Entidades.Articulo"%>
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
        
        <%

        Articulo a = Conexion.getInstance().getControladorDeArticulos().getArticulo(8);
        byte[] img = a.getImagenDeFondo();
        byte[] encoded = Base64.getEncoder().encode(img);
        String imagen = new String(encoded);
        String imagen2 = "data:image/jpeg;base64,"+ imagen;
        
        %>
        
        <img src=<% out.print(imagen2); %> />
        
        
    </body>
</html>
