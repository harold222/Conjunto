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
            
            int id=Integer.parseInt(request.getParameter("id"));
            
            ps=con.prepareStatement("select * from persona where identificacion="+id);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
            <form action="" method="post" class="form-control" >
                
                <div class="container col-lg-3">
                    
                    <div class="form-group text-center">
                        <p><strong>Actualizar datos del perfil</strong></p>
                        <hr>
                    </div>
                    
                    <div class="form-group">
                        <label>Cedula:</label>
                        <input type="text" name="txtcedula" readonly="" value="<%= rs.getInt("identificacion")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input type="text" name="txtnombre" value="<%= rs.getString("nombre")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Apellido:</label>
                        <input type="text" name="txtapellido" value="<%= rs.getString("apellido")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Correo Electronico:</label>
                        <input type="text" name="txtcorreo" value="<%= rs.getString("correoelectronico")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="txtcelular" value="<%= rs.getString("celular")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input type="text" name="txttelefono" value="<%= rs.getString("telefono")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>clave:</label>
                        <input type="password" name="txtclave" value="<%= rs.getString("clave")%>" class="form-control">
                    </div>
                    
                    <input class="btn btn-success" type="submit" name="btnEditarEmpresaVigilancia" value="Guardar Datos">
                    
                    <input class="btn btn-warning" name="btnDevolver" value="Volver" onclick=window.location='../admin.jsp' >
                </div>
              <% }%>
            </form>
    </body>
</html>
<%
    String ced,nom,ape,cor,tel,cel,pass;
    ced=request.getParameter("txtcedula");
    nom=request.getParameter("txtnombre");
    ape=request.getParameter("txtapellido");
    cor=request.getParameter("txtcorreo");
    tel=request.getParameter("txttelefono");
    cel=request.getParameter("txtcelular");
    pass=request.getParameter("txtclave");
    
    if(ced!=null && nom!=null && ape!=null && cor!=null && tel!=null && cel!=null && pass!=null){
        ps=con.prepareStatement("update persona set nombre='"+nom+"', apellido='"+ape+"', correoElectronico='"+cor+"', celular='"+cel+"', telefono='"+tel+"', clave='"+pass+"'WHERE identificacion="+ced);

        ps.executeUpdate();
        response.sendRedirect("../admin.jsp");
    }
%>
