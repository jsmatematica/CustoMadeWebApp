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
          <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
        <style>     
            table{
                text-align: center;
                margin: 4vh auto;
                border: solid;
                border-radius: 10px;
                padding: 10px;
                font-family: 'Oswald' ,sans-serif;
            }
            h2{
                text-transform: uppercase;
                font-family: 'Oswald' ,sans-serif;
                text-align: center;
                margin-top: 10%;
            }
            .ver{
                color: black;
            }
            .ver:hover{
                text-decoration: none;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peiddos del Usuario</title>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <h2>Pedidos del usuario: </h2>
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
                <td><a class="ver" href='verdisenios.jsp?idPedido=<%out.print(next.getId());%>'>Ver diseños</a></td>
            </tr>
            <%
        }
        
        %>
        </table>
        <div class="footer">&copy;<span id="year"> </span><span> CUSTOMADE. All rights reserved.</span></div>
    </body>
</html>
