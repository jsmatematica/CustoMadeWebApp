/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.Conexion;
import customade2.Entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = {"/iniciarSesion"})
public class iniciarSesion extends HttpServlet {

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
            String passmd5 = Encriptador.getMD5(request.getParameter("pass")); //= Encriptador.getMD5(request.getParameter("pass"));
            List<Usuario> us = Conexion.getInstance().select("FROM Usuario where email ='"+request.getParameter("email")+"'", Usuario.class);
            ;
            if(us.size()==0){
            out.print("Datos de usuario Incorrectos");
            }else if(!us.get(0).getPassword().equals(passmd5)){
            out.print("Datos de usuario Incorrectos");
            }else{
            sesion.setAttribute("Usuario", us.get(0));
            
            out.println("<script>");
            out.println("window.onload = function(){");
            out.println("window.location.href='index.jsp';");
            out.println("alert('Sesion iniciada');");
            out.println("}");
            out.println("</script>");

//            out.print("Sesion iniciada<br>");
//            out.println("<a href='index.jsp'>Volver al inicio</a>");
            
            }
            

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
