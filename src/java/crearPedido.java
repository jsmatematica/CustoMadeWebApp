/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.Conexion;
import DTO.DatosCliente;
import DTOs.Carrito;
import customade2.Entidades.DetalleDePedido;
import customade2.Entidades.Disenio;
import customade2.Entidades.EstadoPedido;
import customade2.Entidades.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(urlPatterns = {"/crearPedido"})
public class crearPedido extends HttpServlet {

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
            List<DetalleDePedido> detalles = new ArrayList<DetalleDePedido>();
            List<Long> idDetalles = (List<Long>) sesion.getAttribute("idDetalles");
            int i=0;
            while(i<idDetalles.size()){
            detalles.add((Conexion.getInstance().select("FROM DetalleDePedido WHERE id="+idDetalles.get(i), DetalleDePedido.class)).get(0));
            i++;
            }
            
            String nombre = request.getParameter("nombrecompleto");
            int ci = Integer.parseInt(request.getParameter("ci"));
            String email = request.getParameter("email");
            String dir = request.getParameter("dir");
            String tel =  request.getParameter("tel");
            
            DatosCliente datos = new DatosCliente();
            datos.setCi(ci);
            datos.setDireccion(dir);
            datos.setEmail(email);
            datos.setNombreCompleto(nombre);
            datos.setTelefono(tel);
            Conexion.getInstance().getControladorDePedidos().crearPedidoNoRegistrado(datos, detalles);
            out.print("Pedido enviado");
            //VAMO A HACERLO A MANO 
//            Pedido p = new Pedido();
//            p.setCiCliente(ci);
//            p.setDireccionCLiente(dir);
//            p.setEmailCliente(email);
//            p.setEstado(EstadoPedido.NOVISTO);
//            Date fecha = new Date();
//            p.setFecha(fecha);
//            Carrito carrito = (Carrito) sesion.getAttribute("carrito");
//            List<Disenio> disenios = carrito.disenios;
//            int i =0;
//            float precioTotal = 0;
//            while(i<disenios.size()){
//            
//                Disenio d = disenios.get(i);
                
//                Conexion.getInstance().getCOntroladorDeDisenios().guardarDisenio(d.getNombre(), d.getArticulo().getId(), d.getImagens().get(0).getAncho(), 0, d.getImagens().get(0).getMarginLeft(),d.getImagens().get(0).getMarginTop(), d.getImagens().get(0).getImagenProporcionada(),d.getImagens().get(1).getAncho(), 0, d.getImagens().get(1).getMarginLeft(), d.getImagens().get(1).getMarginTop(), d.getImagens().get(1).getImagenProporcionada(), false);
//    public void guardarDisenio(String nombreDelDisenio, long idArticulo, int anchoImagenFRONT, int altoImagenFRONT, int marginLeftFRONT, int marginTopFRONT, byte[] imagenFRONT,int anchoImagenBACK, int altoImagenBACK, int marginLeftBACK, int marginTopBACK, byte[] imagenBACK, boolean publico)



//                DetalleDePedido detalle = new DetalleDePedido();
//                detalle.setCantidad(cantidades.get(i));
//                detalle.setDisneioDelDetalle(disenios.get(i));
//                detalle.setPedido(p);
//                detalle.setPrecioUnitario(disenios.get(i).getPrecioUnitario());
//                precioTotal = precioTotal + cantidades.get(i)*disenios.get(i).getPrecioUnitario();
//                Conexion.getInstance().persist(detalle);
//                detalles.add(detalle);                         
//            i++;
//            }
//            p.setDetalleDePedidos(detalles);
//            p.setNombreCompletoCliente(nombre);
//            p.setTelefonoCliente(tel);
//            p.setPrecioTotal(precioTotal);
//            Conexion.getInstance().persist(p);
//            
//            
//            
//            out.print("funcionando");


            
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
