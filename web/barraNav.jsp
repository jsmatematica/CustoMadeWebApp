<%-- 
    Document   : barraNav
    Created on : Oct 18, 2022, 11:26:42 AM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*" session='true'%>

<!DOCTYPE html>
<head>
    <%
     HttpSession sesion=request.getSession();
    %>
    <style>
        nav{
            height: 15vh;
            border: solid;
            position: relative;
            font-family: sans-serif;
            padding: 0;
            display: flex;
        }
        nav img{
            height:  15vh;
        }
        nav a{
            position: absolute;
            right: 0;
            top: 30%;
            margin: 1%;
            font-size: 1.5vw;
            text-decoration: none;
            color: black;
        }
        #inicioDeSesion{
            right: 10%;
            
        }
        #verPedido{
            right: 10%;
            
        }
        #verCarrito{
            display: flex;
            opasity: 1;
            height: 45%;
            position: absolute;
            top: 30%;
            right: 20%;
            z-index: -1;
        }
        iframe{
            width: 85vw;
            height: 85vh;
            border: none;
        }
        dialog{
            border: none;
        }
        dialog button{
            background: none;
            border: none;
        }
        
        #novacio{
            width: 1vw;
            height: 1vw;
            position: absolute;
            top: 50%;
            right: 21%;
            display: flex;
            z-index: 1;
            visibility: <% 
            
                    if(sesion.getAttribute("carrito")==null){
                    out.print("hidden");
                    }else{
                    out.print("visible");
                    }
                
                
                %>;
        }
    </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<nav>
    <img src="customade.png" alt="logo">
        <img id="novacio" src="plusrojo.png">
    <img id="verCarrito" src="carrito.png" alt="carrito">
    <% if(sesion.getAttribute("Usuario")==null){ %>
    <a id="inicioDeSesion" href='iniciodesesion.jsp' >Iniciar Sesión</a>
    <a id="registro" href='registroDeUsuario.jsp'>Registrarse</a>
    <%}else{%>
    
    <a id="verPedido" href='verpedidosUsuario.jsp' >Mis Pedidos</a>
    <a id="cerrarsesion" href='cerrarSesion.jsp'>Cerrar Sesión</a>
    
    <%}%>
    <dialog id="visualizador">
        <button id="cerrar">X</button>
            <iframe src="mostrarCarrito.jsp">
        
    </iframe>
    </dialog>
</nav>


<script>
    document.getElementById("novacio").onclick = function(){
            document.getElementById("visualizador").showModal();
     }
document.getElementById("cerrar").onclick = function(){
            document.getElementById('visualizador').close();
        }

    
        
</script>
