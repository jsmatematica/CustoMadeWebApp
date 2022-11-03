<%-- 
    Document   : verdisenios
    Created on : Oct 24, 2022, 2:58:13 PM
    Author     : jsmat
--%>

<%@page import="customade2.Entidades.Pedido"%>
<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <%
       long idPedido = Long.parseLong(request.getParameter("idPedido"));
       
       Pedido p = Conexion.getInstance().getControladorDePedidos().getPedido(idPedido);
       
       %>
       <table>
           <th>
               Id
           </th>
           <th>
               Precio unitario
           </th>
           <th> 
           Cantidad
           </th>

       </table>
    </body>
</html>
