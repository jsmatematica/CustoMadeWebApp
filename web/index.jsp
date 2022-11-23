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
            }
            .galeria{
                margin-top: 10vh;
                margin-left: 10vw;
            }
            p{
                margin-top: 15vh;
                margin-left: 15vw;
            }
            #parrafomedio {
               text-align: center; 
                 margin-top: 15vh;
                margin-left: 20vw;
                background-color: black;
                color:white;
                margin-right: 20vw; 
            }
             body {
                 font-family: 'Oswald' ,sans-serif;
                background-image: url('background.jpg');
                background-size: 30%;
                 
            }
            
        </style>
    </head>
    <body>
        <%@include file="barraNav.jsp" %>
        <a href='consultarpedidos.jsp'>Seguimiento de Pedidos</a>
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
          <img src="buscandoeninternet.webp" alt="Los Angeles" style="width:100%;">
      <div class="carousel-caption">
      <h3>Busca</h3>
        <p>en internet la imagen con la que quieres personalizar tu diseño</p>
      </div>
      </div>

      <div class="item">
          <img src="creandoeldisenio.png" alt="Chicago" style="width:100%;">
          <div class="carousel-caption">
            <h3>Crea</h3>
        <p>tu diseño con todo lo que más te gusta</p>
      </div>
      </div>
    
      <div class="item">
          <img src="noscomunicamos.jpg" alt="New york" style="width:100%;">
        <div class="carousel-caption">
            <h3>Envíanos</h3>
        <p>tu pedido con tus creaciones y nos contactaremos contigo para coordinar el pago y el envío</p>
      </div>
      </div>
        
      <div class="item">
          <img src="recibiendopaquete.jfif" alt="New york" style="width:100%;">
        <div class="carousel-caption">
            <h3>Recibirás</h3>
        <p>tus obras de arte sin la necesidad de moverte de tu casa</p>
      </div>
      </div>
        
       <div class="item">
          <img src="ropa.jpg" alt="New york" style="width:75%;">
        <div class="carousel-caption">
            <h3>Lúcete</h3>
        <p>con tus diseños personalizados y publica tus diseños en nuestra web para que otros puedan disfrutar de tu arte</p>
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
        <p id="parrafomedio">
            También puedes elegir alguno de los diseños que nuestros usuarios han compartido con nosotros, si te gusta alguno úsalo!
        </p> 
        <div class="galeria">
            <%@include file="galeriaDeDisenios.jsp" %>
        </div>
    </body>
</html>
