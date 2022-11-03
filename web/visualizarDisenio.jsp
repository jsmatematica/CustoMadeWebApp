<%-- 
    Document   : visualizarDisenio
    Created on : Oct 24, 2022, 2:58:41 PM
    Author     : jsmat
--%>

<%@page import="customade2.Entidades.Imagen"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="customade2.Entidades.Disenio"%>
<%@page import="BD.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%  long idDisenio = Long.parseLong(request.getParameter("idDisenio"));
        Disenio d = Conexion.getInstance().getCOntroladorDeDisenios().getDisenio(idDisenio);
        byte[] img = d.getArticulo().getImagenDeFondo();
        byte[] encoded = Base64.getEncoder().encode(img);
        String imagen22 = new String(encoded);
        String imagen222 = "data:image/jpeg;base64,"+ imagen22;
//        List<Imagen> imgs = Conexion.getInstance().select("FROM Imagen WHERE disenio_id="+d.getId(), Imagen.class);
//        d.setImagens(imgs);
//        
        byte[] imgFront = d.getImagens().get(0).getImagenProporcionada();
        byte[] imgback = d.getImagens().get(1).getImagenProporcionada();
        
        byte[] encodedFront = Base64.getEncoder().encode(imgFront);
        byte[] encodedback = Base64.getEncoder().encode(imgback);
        String imgFrontstr = "data:image/jpeg;base64,"+ (new String(encodedFront)); 
        String imgBackstr = "data:image/jpeg;base64,"+ (new String(encodedback)); 
        %>
          <style>
  
      body{
          font-family: sans-serif;
      }
.cuadro{
display: flex;
width: 75vw;
height: 37vw;
border: solid;
background-image: url('<%
    out.print(imagen222);
    %>');
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

fieldset{
    width: 20vw;
}

#imgFrente{
    top: <%
        out.print(d.getImagens().get(0).getMarginTop());
    %>%;
    left: <%
        out.print(d.getImagens().get(0).getMarginLeft());
        %>%;
    width: <% 
        out.print(d.getImagens().get(0).getAncho()); 
    %>%;
    
}

#imgBack{
    top: <%
        out.print(d.getImagens().get(1).getMarginTop());
    %>%;
    left: <% 
        out.print(d.getImagens().get(1).getMarginLeft());
        %>%;
    width: <%
        out.print(d.getImagens().get(1).getAncho());
        %>%;
    
}
  
  </style>
    </head>
    <body>
        <div class="cuadro" id='cuadro2'>
            <% 
//                out.print(d.getImagens().size()); 
            %>
<div class="editarFrente">
    <img id="imgFrente" src="<%
        out.print(imgFrontstr); 
    %>">
</div>

<div class="editarBack">
    <img id="imgBack" src="<%
        out.print(imgBackstr);
    %>">	
</div>
</div> 
    </body>
</html>
