<%-- 
    Document   : index
    Created on : Sep 30, 2022, 9:24:13 AM
    Author     : jsmat
--%>

<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>CUSTOMADE</title>
        <style>
            .container{
                width: 50vw;
                height: 75vh; 
            }
            
            .comenzar{
                position: relative;
                display: flex;
            }

            .comenzar button{
                position: absolute;
                left: 45%;
                background-color: black;
                font-size: 1.2vw;
            }
            .comenzar button:hover{
                background-color: black;   
                padding-top: 0.5%;
                padding-bottom: 0.5%;
            }
            .galeria{
                margin-top: 10vh;
                margin-left: 10vw;
            }
            .pe{
                margin-top: 15vh;
                margin-left: 15vw;
                font-family: 'Oswald' ,sans-serif;
                font-size: 2vh;
               text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
               }
             
            .parrafomedio {
               text-align: center; 
                margin-top: 3vw;
                margin-left: 30vw;
                font-size: 1vw;
                color:black;
                margin-right: 30vw;
                pointer-events: none;    
            }
            
            
            
             body {
                 font-family: 'Oswald' ,sans-serif;
            }
            .seguimiento{
                                            
                    background: black;
                    padding: 0.5%; 
                     text-transform: uppercase;
                     color: white;
                     font-size: 0.9vw;
                    
            }
            .seguimiento:hover{
                padding: 1%;
                text-decoration: none;
                color: white;
            }
            .titulo{
                font-family: 'Oswald' ,sans-serif;
                text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
                font-size: 4vh;
            }
            
        </style>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <a class="seguimiento" href='consultarpedidos.jsp'>Seguimiento de Pedidos</a>
        <% Conexion.getInstance();  %>
        
        <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
          <img src="hombre.jpg" alt="Los Angeles" style="width:100%;">
      <div class="carousel-caption">
      <h3 class="titulo">BUSCA</h3>
        <p class="pe">en internet la imagen con la que quieres personalizar tu diseño</p>
      </div>
      </div>

      <div class="item">
          <img src="creandoeldisenio.png" alt="Chicago" style="width:100%;">
          <div class="carousel-caption">
            <h3 class="titulo">CREA</h3>
        <p class="pe">tu diseño con todo lo que más te gusta</p>
      </div>
      </div>
    
      <div class="item">
          <img src="noscomunicamos.jpg" alt="New york" style="width:100%;">
        <div class="carousel-caption">
            <h3 class="titulo">ENVÍANOS</h3>
        <p class="pe">tu pedido con tus creaciones y nos contactaremos contigo para coordinar el pago y el envío</p>
      </div>
      </div>
        
      <div class="item">
          <img src="hombredelivery.jpg" alt="New york" style="width:100%;">
        <div class="carousel-caption">
            <h3 class="titulo">RECIBIRÁS</h3>
        <p class="pe">tus obras de arte sin la necesidad de moverte de tu casa</p>
      </div>
      </div>
        
       <div class="item">
          <img src="hombreremera.jpg" alt="New york" style="width:75%;">
        <div class="carousel-caption">
            <h3 class="titulo">LÚCETE</h3>
        <p class="pe">con tus diseños personalizados y publica tus diseños en nuestra web para que otros puedan disfrutar de tu arte</p>
      </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        <div class='comenzar'>
            <a href='editor.jsp'>
            <button type="button" class="btn btn-primary">COMENCEMOS!!!</button>
            <a/>
        </div>
        <p class="parrafomedio">
            También puedes elegir alguno de los diseños que nuestros usuarios han compartido con nosotros, si te gusta alguno úsalo!
        </p> 
        <div class="galeria">
            <%@include file="galeriaDeDisenios.jsp" %>
        </div>
    </body>
</html>
