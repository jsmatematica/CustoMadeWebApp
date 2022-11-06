<%-- 
    Document   : verpedidosUsuario
    Created on : Oct 23, 2022, 9:16:54 PM
    Author     : jsmat
--%>

<%@page import="customade2.Entidades.DetalleDePedido"%>
<%@page import="java.util.Iterator"%>
<%@page import="BD.Conexion"%>
<%@page import="customade2.Entidades.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="customade2.Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>     
            table{
                text-align: center;
                margin: 15vh auto;
                border: solid;
                border-radius: 10px;
                padding: 10px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peiddos del Usuario</title>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <h2>Peididos del usuario: </h2>
        <%
         int ci =0;
        if(sesion.getAttribute("Usuario") == null){
        ci = Integer.parseInt(sesion.getAttribute("ci").toString());
        }else{
        Usuario u = (Usuario) sesion.getAttribute("Usuario");
        ci = u.getCi();
        }
        List<Pedido> pedidos = Conexion.getInstance().select("FROM Pedido WHERE ciCliente = "+ci, Pedido.class);
        %>
        <table>
            <th>Fecha y Hora</th>
            <th>Precio del Pedido</th>
            <th>Estado del Pedido</th>
        <%
        for (Iterator<Pedido> iterator = pedidos.iterator(); iterator.hasNext();) {
            Pedido next = iterator.next();
            
            List<DetalleDePedido> detalles = next.getDetalleDePedidos();
            float precioTotal = 0;
            for (Iterator<DetalleDePedido> it = detalles.iterator(); it.hasNext();) {
                    DetalleDePedido next2 = it.next();
                    precioTotal = precioTotal + (next2.getCantidad()*next2.getPrecioUnitario());
                }
            next.setPrecioTotal(precioTotal);
            %>
            <tr>
                <td><% out.print(next.getFecha()); %></td>
                <td><% out.print("$"+next.getPrecioTotal());%></td>
                <td><% out.print(next.getEstado()); %></td>
                <td><a href='verdisenios.jsp?idPedido=<%out.print(next.getId());%>'>Ver diseños</a></td>
            </tr>
            <%
        }
        
        %>
        </table>
    </body>
</html>
