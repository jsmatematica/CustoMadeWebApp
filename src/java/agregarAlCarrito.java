/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.Conexion;
import DTOs.Carrito;
import customade2.Entidades.Articulo;
import customade2.Entidades.Disenio;
import customade2.Entidades.Imagen;
import customade2.Entidades.Posicion;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jsmat
 */
@WebServlet(urlPatterns = {"/agregarAlCarrito"})
public class agregarAlCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sesion = request.getSession();
            
            Carrito carrito = new Carrito();
            if(sesion.getAttribute("carrito") != null){
            carrito = (Carrito) sesion.getAttribute("carrito");
            }
            
            Imagen imgFront = new Imagen();
            imgFront.setMarginLeft(parseInt(request.getParameter("leftFront")));
            imgFront.setAncho(parseInt(request.getParameter("anchoFrente")));
            imgFront.setMarginTop(parseInt(request.getParameter("topFront")));
            imgFront.setPosicionBackFront(Posicion.FRONT);
            
            
            String base64Front = request.getParameter("imgFront").toString();
            String base64SinUrlFront = base64Front.substring(base64Front.indexOf(",") + 1);
            byte[] imgFrontBytes = Base64.getDecoder().decode(base64SinUrlFront.getBytes());
            imgFront.setImagenProporcionada(imgFrontBytes);
            
            
            Imagen imgBack = new Imagen();
            imgBack.setMarginLeft(parseInt(request.getParameter("leftBack")));
            imgBack.setAncho(parseInt(request.getParameter("anchoBack")));
            imgBack.setMarginTop(parseInt(request.getParameter("topBack")));
            imgBack.setPosicionBackFront(Posicion.BACK);
            
            
            String base64Back = request.getParameter("imgBack").toString();
            String base64SinUrlBack = base64Back.substring(base64Back.indexOf(",") + 1);
            byte[] imgBackBytes = Base64.getDecoder().decode(base64SinUrlBack.getBytes());
            imgBack.setImagenProporcionada(imgBackBytes);
            
            String talle = request.getParameter("talleEnviar");
            
            Articulo a = Conexion.getInstance().getControladorDeArticulos().getArticulo(Long.parseLong(request.getParameter("idArticulo")));
            String tipo = TipoArtMAPPER.TypeToString(a.getTipo());
            String color = a.getColor();
            List<Articulo> arts = Conexion.getInstance().select("FROM Articulo WHERE tipo ='"+tipo+"' AND talle = '"+talle+"' AND color ='"+color+"'", Articulo.class);
            
            Articulo esteArticulo = arts.get(0);
            
            Disenio d = new Disenio();
            d.setArticulo(esteArticulo);
            List<Imagen> imagenes = new ArrayList<Imagen>();
            imagenes.add(imgFront);
            imagenes.add(imgBack);
            imgBack.setDisenio(d);
            imgFront.setDisenio(d);
            d.setImagens(imagenes);
            d.setPrecioUnitario(esteArticulo.getPrecioUnitario());
            d.setNombre(request.getParameter("nombre"));
            d.setPublico(false);
            carrito.disenios.add(d);
            carrito.miniaturas.add(request.getParameter("miniatura"));
            Conexion.getInstance().persist(d);
            List<Long> idDisenios = new ArrayList<Long>();
            if(sesion.getAttribute("idDisenios")!=null){
            idDisenios = (List<Long>) sesion.getAttribute("idDisenios");
            }
            idDisenios.add(d.getId());
            sesion.setAttribute("idDisenios", idDisenios);
            sesion.setAttribute("carrito", carrito);
            out.print("Tu diseño se agregó correctamente");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
