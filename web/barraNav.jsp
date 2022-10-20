<%-- 
    Document   : barraNav
    Created on : Oct 18, 2022, 11:26:42 AM
    Author     : jsmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
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
        #carrito{
            opasity: 1;
            height: 45%;
            position: absolute;
            top: 30%;
            right: 20%;
        }
        
    </style>
</head>
<nav>
    <img src="customade.png" alt="logo">
    <img id="carrito" src="carrito.png" alt="carrito">
    <a id="inicioDeSesion" href='' >Iniciar Sesión</a><a id="registro" href=''>Registrarse</a>
</nav>
