<%-- 
    Document   : mostrarCarrito
    Created on : Oct 21, 2022, 6:48:43 PM
    Author     : jsmat
--%>
<%@page import="DTOs.Carrito"%>
<%@page import="customade2.Entidades.Disenio"%>
<%@page  import="java.util.*" session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        
        <style> 
            #cuadro{
                font-family: sans-serif;
                border: solid;
                border-radius: 22px;
                width: 85vw;
                height: 85vh;
                position: relative;
                left: 5vw;
                top: 5vh;
            }
            
            #cuadro table{
                width: 85vw;
                padding: 1vw;
                text-align: center;
            }
            
            .miniaturas{
                
                width: 10vw;
            }
        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        
    </head>
    <body>
            <%

            HttpSession sesion = request.getSession();
//            
Carrito carrito = new Carrito();
        carrito = (Carrito) sesion.getAttribute("carrito");         
            %>
            <div id="cuadro">
                <table>
                    <tr>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Precio por Unidad
                        </th>
                        <th>
                            Cantidad
                        </th>
                    </tr>
                    <%
                      int i =0;
                      while(i<carrito.disenios.size()){
                      %>
                      <tr>
                          <td>
                              <% out.print(carrito.disenios.get(i).getNombre()); %>
                          </td>
                          <td>  
                              <% out.print(carrito.disenios.get(i).getPrecioUnitario()); %>
                          </td>
                          <td>
                              <input type="number" id="cantidad<% out.print(i); %>" value="1" readonly="readonly"> <button id="sumar<% out.print(i); %>">+</button> <button id="restar<% out.print(i);%>" >-</button>
                          </td>
                          <td>
                              <img class="miniaturas" src=<% out.print(carrito.miniaturas.get(i)); %> >
                          </td>
                      </tr>
                    <%
                        i++;
                      }

                    %>
                </table>
                <button id="finalizarpedido">Finalizar Pedido</button>
            </div>  
            
                <script>
                    <%
                    int j = 0;
                    while(j<carrito.disenios.size()){
                    
                        %>
                    document.getElementById('sumar<% out.print(j); %>').onclick = function(){
                        
                        document.getElementById("cantidad<% out.print(j); %>").value = parseInt(document.getElementById("cantidad<% out.print(j); %>").value) + 1;
                        
                    }
                    
                    document.getElementById('restar<% out.print(j); %>').onclick = function(){
                        
                        if(parseInt(document.getElementById("cantidad<% out.print(j); %>").value)>=2){
                        document.getElementById("cantidad<% out.print(j); %>").value = parseInt(document.getElementById("cantidad<% out.print(j); %>").value) - 1;
                    }
                    }
                        
                        <%
                    j++;
                    }
                    %>
                 document.getElementById("finalizarpedido").onclick = function(){
                     
                     <%
                     int h=0;
                     while(h<carrito.disenios.size()){
                     
                     %> var cantidad<% out.print(h); %>Var = parseInt(document.getElementById('cantidad<% out.print(h); %>').value); <%
                     h++;
                     }
                     %>    
                      $.post('generarDetallesDePedido', {
				<%
                                int u=0;
                                while(u<carrito.disenios.size()-1){
                                    %>
                                       cantidad<% out.print(u); %> :  cantidad<% out.print(u); %>Var,
                                    <%
                                u++;
                                }
                                %>cantidad<% out.print(carrito.disenios.size()-1); %> : cantidad<% out.print(carrito.disenios.size()-1); %>Var
			}, function(responseText) {
                                <% if(sesion.getAttribute("Usuario")==null){%>
                            window.location.href="finalizarPedidoSinRegistro.jsp";
                            <%}else{%>
                                window.location.href="confirmarPedido.jsp";
                                
                                <%}%>
			}); 
                      
                     
                 }
                </script>
    </body>
</html>
