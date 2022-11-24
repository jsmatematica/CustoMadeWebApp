<%-- 
    Document   : galeriaDeDisenios
    Created on : Nov 4, 2022, 3:27:05 PM
    Author     : jsmat
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.lang.InterruptedException"%>
<%@page import="java.util.Iterator"%>
<%@page import="customade2.Entidades.Disenio"%>
<%@page import="java.util.List"%>
<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Galeria </title>
        <style> 
            body{
                border: solid;
            }
/*            iframe{
                width: 15vw;
                height: 11vw;
            }*/
            figure{
                border: solid;
                width: calc(40vw + 5px);
                height: calc(20vw + 2em + 5px);
                text-align: center;
                display: inline-block;
                background: white;
                color: black;
                transition: transform .2s;
            }
            
            
            /*
            Aqui esta lo que viene del visualizador de disenios
            */
            
.cuadro{
    margin: auto;
    margin-top: 5%;
display: flex;
width: 75%;
height: 67%;
border: solid;
background-size: 100% 100%;
background-repeat: no-repeat;
}

.cuadro div{
	overflow:hidden;
        position: relative;
}
.cuadro div img{
	position: relative;
        width: 100%;
	}
.editarFrente{
width: 15%;
height: 53%;
left: 18%;
top: 27%;
}


.editarBack{
left: 50%;
top: 27%;
width: 15%;
height: 53%;
}

figure:hover{
    transform: scale(1.08);
}

        </style>
    </head>
    <body>
 
            
            <%
            List<Disenio> disenios = Conexion.getInstance().select("FROM Disenio where publico = 1", Disenio.class);
            
            for (Iterator<Disenio> iterator = disenios.iterator(); iterator.hasNext();) {
            Disenio next = iterator.next();
           

 byte[] img = next.getArticulo().getImagenDeFondo();
        byte[] encoded = Base64.getEncoder().encode(img);
        String imagen22 = new String(encoded);
        String imagen222 = "data:image/jpeg;base64,"+ imagen22;
//        List<Imagen> imgs = Conexion.getInstance().select("FROM Imagen WHERE disenio_id="+d.getId(), Imagen.class);
//        d.setImagens(imgs);
//        
        byte[] imgFront = next.getImagens().get(0).getImagenProporcionada();
        byte[] imgback = next.getImagens().get(1).getImagenProporcionada();
        
        byte[] encodedFront = Base64.getEncoder().encode(imgFront);
        byte[] encodedback = Base64.getEncoder().encode(imgback);
        String imgFrontstr = "data:image/jpeg;base64,"+ (new String(encodedFront)); 
        String imgBackstr = "data:image/jpeg;base64,"+ (new String(encodedback)); 


            %>
            
            <a href='editarDisenio.jsp?idDisenio=<% out.print(next.getId()); %>'>  
            <figure>
<div class="cuadro" id='cuadro2'
     style="background-image: url('<%
    out.print(imagen222);
    %>');"
     
     >
<div class="editarFrente">
    <img id="imgFrente" src="<%
        out.print(imgFrontstr); 
    %>"
    style="    top: <%
        out.print(next.getImagens().get(0).getMarginTop());
    %>%;
    left: <%
        out.print(next.getImagens().get(0).getMarginLeft());
        %>%;
    width: <% 
        out.print(next.getImagens().get(0).getAncho()); 
    %>%;"
    >
</div>

<div class="editarBack">
    <img id="imgBack" src="<%
        out.print(imgBackstr);
    %>"
    style="
        top: <%
        out.print(next.getImagens().get(1).getMarginTop());
    %>%;
    left: <% 
        out.print(next.getImagens().get(1).getMarginLeft());
        %>%;
    width: <%
        out.print(next.getImagens().get(1).getAncho());
        %>%;
    "
    >	
</div>
</div> 
    <figcaption>
        <% out.print(next.getNombre()); %>
    </figcaption>
    </figure>
         </a>   
        
        <%
        }

            %>
            
            

    </body>
</html>
