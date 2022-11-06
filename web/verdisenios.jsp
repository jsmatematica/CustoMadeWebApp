<%-- 
    Document   : verdisenios
    Created on : Oct 24, 2022, 2:58:13 PM
    Author     : jsmat
--%>

<%@page import="customade2.Entidades.Disenio"%>
<%@page import="java.util.Iterator"%>
<%@page import="customade2.Entidades.DetalleDePedido"%>
<%@page import="customade2.Entidades.Pedido"%>
<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <style>
            table dialog{
                width: 50vw;
                height: 50vh;
            }
            table iframe{
                border: none;
                width: 48vw;
                height: 48vh;
            }
            table{
                text-align: center;
                margin: 15vh auto;
                border: solid;
                border-radius: 10px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
       <%
       long idPedido = Long.parseLong(request.getParameter("idPedido"));
       
       Pedido p = Conexion.getInstance().getControladorDePedidos().getPedido(idPedido);
       
       %>
       <table>
           <th>
               Id
           </th>
           <th>
               Nombre del Diseño
           </th>
           <th>
               Precio unitario
           </th>
           <th> 
           Cantidad
           </th>
           <%
            for (Iterator<DetalleDePedido> iterator = p.getDetalleDePedidos().iterator(); iterator.hasNext();) {
            DetalleDePedido next = iterator.next();
            Disenio d = next.getDisneioDelDetalle();
            %>
            <tr>
                <td>
                    <% out.print(d.getId()); %>
                </td>
                <td>
                    <% out.print(d.getNombre()); %>
                </td>
                <td>
                    <% out.print(d.getPrecioUnitario()); %>
                </td>
                <td>
                    <% out.print(next.getCantidad()); %>
                </td>
                <td>    
                    <button id="verdisenio<% out.print(d.getId()); %>">Ver Diseño</button>    
                    <dialog id="visualizador<% out.print(d.getId()); %>">
        <button id="cerrar<% out.print(d.getId()); %>">X</button>
        <iframe src="visualizarDisenio.jsp?idDisenio=<% out.print(d.getId()); %>">
        
    </iframe>
    </dialog>
                </td>
                <td>
                    <input type="button" id="publicar<% out.print(d.getId());  %>" value="<%
                        if(d.isPublico()){
                        out.print("NO PUBLICAR");
                        }else{
                        out.print("PUBLICAR");
                        }
                        %>">
                </td>
                <td>
                    <div id="publicado<% out.print(d.getId()); %>">
                    
                        <%
                        if(d.isPublico()){
                        out.print("PUBLICO");
                        }else{
                        out.print("PRIVADO");
                        }
                        %>
                        
                    </div>
                </td>
            </tr>
           <%
 
 }%>
       </table>
    </body>
    
      <%
            for (Iterator<DetalleDePedido> iterator = p.getDetalleDePedidos().iterator(); iterator.hasNext();) {
            DetalleDePedido next = iterator.next();
            Disenio d = next.getDisneioDelDetalle();
      %>
      
    <script>
    document.getElementById("verdisenio<% out.print(d.getId()); %>").onclick = function(){
            document.getElementById("visualizador<% out.print(d.getId()); %>").showModal();
     }
document.getElementById("cerrar<% out.print(d.getId()); %>").onclick = function(){
            document.getElementById('visualizador<% out.print(d.getId()); %>').close();
        }

        document.getElementById("publicar<% out.print(d.getId());  %>").onclick = function(){
            
            var idDisenioVar = <% out.print(d.getId()); %>;
            if(document.getElementById("publicar<% out.print(d.getId());  %>").value == "PUBLICAR"){
                document.getElementById("publicar<% out.print(d.getId());  %>").value = "NO PUBLICAR";
            }else{
                document.getElementById("publicar<% out.print(d.getId());  %>").value = "PUBLICAR";
            }
            $.post("publicaDisenio",{
                idDisenio : idDisenioVar
            },function(responseText){
                document.getElementById("publicado<% out.print(d.getId()); %>").innerHTML = responseText;
            });
        }
    
        
</script>
    
    <%
      
      
      
      }%>
</html>
