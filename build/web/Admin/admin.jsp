<%-- 
    Document   : admin
    Created on : 18-may-2019, 15:27:44
    Author     : HarolD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>


<%
    HttpSession sesion = request.getSession();
    
    if (sesion.getAttribute("nivel") == null) { //es deicr que no ha estado por el formulario
        response.sendRedirect("../index.jsp");
    }else{
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("1")) {
            response.sendRedirect("../index.jsp");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="right">
            Se ha logiado como administrador del sistema con la identificacion = <%= sesion.getAttribute("identificacion")%>
            <a href="../index.jsp?cerrar=true">Cerrar Sesion</a>
            
            <hr>
        </div>
        
        
    </body>
</html>
