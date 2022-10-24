<%-- 
    Document   : confirmarPedido
    Created on : Oct 23, 2022, 7:50:55 PM
    Author     : jsmat
--%>

<%@page import="BD.Conexion"%>
<%@page import="customade2.Entidades.DetalleDePedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*" session='true'%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>confirmarPedido</title>
    </head>
    <body>
            <%@include file="barraNav.jsp" %>

        <div>
            Precio total: <%
            List<DetalleDePedido> detalles = new ArrayList<DetalleDePedido>();
            List<Long> idDetalles = (List<Long>) sesion.getAttribute("idDetalles");
            int i=0;
            while(i<idDetalles.size()){
            detalles.add((Conexion.getInstance().select("FROM DetalleDePedido WHERE id="+idDetalles.get(i), DetalleDePedido.class)).get(0));
            i++;
            }
            
            float precioTotal = 0;
            int j=0;
            while(j<detalles.size()){
                precioTotal = precioTotal + (detalles.get(j).getPrecioUnitario() * detalles.get(j).getCantidad() );
                j++;
            }
            out.print(precioTotal);
            %>
        </div>
        <button id="confirmar"> Confirmar </button>
        <script>
            document.getElementById('confirmar').onclick = function(){
                
                $.post('crearPedidoRegistrado',{},function(responseText){
                    window.location.href="index.jsp";
                    alert(responseText);
                });
            }
        </script>
    </body>
</html>
