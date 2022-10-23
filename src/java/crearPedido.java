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
            out.println("Pedido enviado");
            out.println("Puede consultar sus pedidos por numero de Cedula aqui: ");
            out.println("<a href='consultarpedidos.jsp'>Buscar Pedidos</a>");
            sesion.invalidate();
            
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
