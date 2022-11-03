<%-- 
    Document   : finalizarPedidoSinRegistro
    Created on : Oct 22, 2022, 8:01:21 PM
    Author     : jsmat
--%>

<%@page import="customade2.Entidades.DetalleDePedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*" session='true'%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Datos de Cliente</title>
    </head>
    <body>
        
        
        
        <form action="crearPedido" method="POST">
            Nombre Completo: <input name="nombrecompleto" type="text"><br>
            C.I.: <input name="ci" type="number"><br>
            email: <input name="email" type="email"><br>
            Dirección: <input name='dir' type='text'><br>
            Teléfono: <input type="text" name="tel"><br>
            <input type='submit' value='Finalizar Pedido'>
        </form>
    </body>
</html>
