/*
 * Dentro de esta clase
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
 *
 * @author Harold Pedraza
 */

public class SERVLOGIN extends HttpServlet {

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
            String ident;
            String contra;
            int nivel =0;
            String Nombre,Correo = null;
            Acceso ACC = new Acceso();
            RequestDispatcher rd = null;
            
            if (request.getParameter("btnIniciar") != null) { //si se envio
                ident = request.getParameter("txtidentificacion");
                contra = request.getParameter("txtcontra"); //traigo lo valores del formulario cuando ya se ha dado al boton
                
                nivel = ACC.validar(ident, contra); //obtengo el nivel de dicho usuario
                Nombre = ACC.obtenerNombre(ident, contra);
                Correo = ACC.obtenerCorreo(ident, contra);
                
                request.setAttribute("nivel", nivel);
                request.setAttribute("identificacion", ident);
                request.setAttribute("nombre", Nombre);
                request.setAttribute("correo", Correo);
                
                rd = request.getRequestDispatcher("index.jsp"); //comunicacion con el index
            }else if (request.getParameter("btnRegistrarme") != null) {
                rd = request.getRequestDispatcher("Registrarme.jsp");
            }
            
            
            rd.forward(request, response); 
            
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
