<%-- 
    Document   : pruebas1
    Created on : Sep 29, 2022, 7:01:54 PM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
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
    </style>
</head>
<body>
    <button id="mostrarCarrito">Ver carrito</button>
    <dialog id="verCarrito">
        <button id="cerrar">X</button>
            <iframe src="mostrarCarrito.jsp">
        
    </iframe>
    </dialog>
    <script>
        
        document.getElementById('mostrarCarrito').onclick = function(){
            
            document.getElementById('verCarrito').showModal();
        }
        document.getElementById("cerrar").onclick = function(){
            document.getElementById('verCarrito').close();
        }
    </script>
    
</body>
</html>
