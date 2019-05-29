<%-- 
    Document   : ActualizarEmpresaVigilancia
    Created on : 21/05/2019, 02:31:14 PM
    Author     : Harold
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="clases.FormularioEmpresadeVigilancia"%>
<%@page import="clases.Acceso"%>
<%@ page import = "java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <link href="../../Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
    
    <jsp:include page='partials/header.jsp'>
        <jsp:param name='title' value='Welcome' />
    </jsp:include>
    
    <body>
           <%
            Connection con;
            String url = "jdbc:mysql://localhost:3306/ingsoftware";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            ResultSet rs;
            
            int id=Integer.parseInt(request.getParameter("cod"));
            ps=con.prepareStatement("select * from Evento where Identificador="+id);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
            <form action="" method="post" class="form-control" >
                
                <div class="container col-lg-3">
                    
                    <div class="form-group text-center">
                        <p><strong>Actualizar datos cdel evento</strong></p>
                        <hr>
                    </div>
                    
                    <div class="form-group">
                        <label>Codigo Evento:</label>
                        <input type="text" name="txtcodigo" readonly="" value="<%= rs.getInt("identificador")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Nombre del evento:</label>
                        <input type="text" name="txtcedula" value="<%= rs.getString("NombreEvento")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Contenido del evento:</label>
                        <input type="text" name="txtnombre" value="<%= rs.getString("ContenidoEvento")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Contenido del evento:</label>
                        <input type="date" name="txtfecha" value="<%= rs.getString("FechaEvento")%>" class="form-control">
                    </div>
                    
                    <input class="btn btn-success" type="submit" name="btnEditarEmpresaVigilancia" value="Guardar Datos">
                    
                    <input class="btn btn-warning" name="btnDevolver" value="Volver" onclick=window.location='Evento.jsp' >
                </div>
              <% }%>
            </form>
    </body>
</html>
<%
    String ced,nom,codi,fecha;
    ced=request.getParameter("txtcedula");
    nom=request.getParameter("txtnombre");
    codi = request.getParameter("txtcodigo");
    fecha = request.getParameter("txtfecha");
    
    if(ced!=null && nom!=null){
        ps=con.prepareStatement("update Evento set NombreEvento='"+ced+"', ContenidoEvento='"+nom+"', FechaEvento='"+fecha+"'WHERE identificador="+codi);

        ps.executeUpdate();
        response.sendRedirect("Evento.jsp");
    }
%>

