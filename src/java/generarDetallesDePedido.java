/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.Conexion;
import DTOs.Carrito;
import customade2.Entidades.DetalleDePedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
@WebServlet(urlPatterns = {"/generarDetallesDePedido"})
public class generarDetallesDePedido extends HttpServlet {

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
            Carrito carrito = (Carrito) sesion.getAttribute("carrito");
            List<Long> idDisenios = (List<Long>) sesion.getAttribute("idDisenios");
            List<Integer> cantidades = new ArrayList<Integer>();
            List<Long> idDetalles = new ArrayList<Long>();
            int i = 0;
            while(i<carrito.disenios.size()){
            cantidades.add(Integer.parseInt(request.getParameter("cantidad"+i)));
                
                i++;
            }
//            
            List<DetalleDePedido> detalles = new ArrayList<DetalleDePedido>();
            
            int j=0;
            while(j<carrito.disenios.size()){
            DetalleDePedido detalle = new DetalleDePedido();
            detalle.setCantidad(cantidades.get(j));
            detalle.setDisneioDelDetalle(Conexion.getInstance().getCOntroladorDeDisenios().getDisenio(idDisenios.get(j)));
            detalle.setPrecioUnitario(carrito.disenios.get(j).getPrecioUnitario());
            Conexion.getInstance().persist(detalle);
            idDetalles.add(detalle.getId());
            j++;
            }
            sesion.setAttribute("idDetalles", idDetalles);
            sesion.setAttribute("detalles", detalles);
            sesion.setAttribute("cantidades", cantidades);
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
