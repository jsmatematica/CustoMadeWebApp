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
                              <input type="number" id="cantidad"+<% out.print(i); %> value="1" readonly="readonly"> <button id="sumar">+</button> <button id="restar">-</button>
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
            </div>  
            
        
    </body>
</html>
