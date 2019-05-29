<%@page import="clases.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Email email = new Email();
            
            String identificacion = request.getParameter("identificacion");
            String remitente = request.getParameter("remitente");
            String clave = request.getParameter("clave");
            String asunto = request.getParameter("asunto");
            String destinatario = request.getParameter("destinatario");
            String torre = request.getParameter("torre");
            String apartamento = request.getParameter("apartamento");
            String mensaje = request.getParameter("mensaje");
            
            Boolean resultado = email.enviarCorreo(identificacion,remitente, clave, asunto, destinatario, torre, apartamento, mensaje);
        
            if(resultado){
                response.sendRedirect("../admin.jsp");
            }else{
                response.sendRedirect("../EnvioCorreo.jsp");
            }
        %>
    </body>
</html>
