/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import clases.Acceso;

/**
 * @author Veronica Quinto
 * cc: 1073528535
 */
public class SERVREGISTROS extends HttpServlet {

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
        PrintWriter out = response.getWriter();
    
            String ident;
            String nom;
            String ape;
            String correo;
            String cel;
            String tel;
            String contra;
            Acceso ACC = new Acceso();
            RequestDispatcher rd = null;
            
            if (request.getParameter("btnRegistros") != null) { //si se envio
                ident = request.getParameter("txtidentificacion");
                nom = request.getParameter("txtnombre");
                ape = request.getParameter("txtapellido");
                correo = request.getParameter("txtcorreo");
                cel = request.getParameter("txtcelular");
                tel = request.getParameter("txttelefono");
                contra = request.getParameter("txtclave"); //traigo lo valores del formulario cuando ya se ha dado al boton
           
                
                if (ACC.registro(ident, nom, ape, correo, cel, tel, contra)) {
                    rd = request.getRequestDispatcher("index.jsp");
                    //response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect("Registrarme.jsp");
                }
                
                //rd = request.getRequestDispatcher("index.jsp"); //comunicacion con el index
            }else if (request.getParameter("btnindex") != null) {
                rd = request.getRequestDispatcher("index.jsp");
            }
            
            rd.forward(request, response); 
        
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
