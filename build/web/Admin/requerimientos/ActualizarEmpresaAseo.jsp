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
            
            int id=Integer.parseInt(request.getParameter("NitEmpresa"));
            ps=con.prepareStatement("select * from empresaAseo where NitEmpresa="+id);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
            <form action="" method="post" class="form-control" >
                
                <div class="container col-lg-3">
                    
                    <div class="form-group text-center">
                        <p><strong>Actualizar datos de empresa de vigilancia</strong></p>
                        <hr>
                    </div>
                    
                    <div class="form-group">
                        <label>Nit Empresa:</label>
                        <input type="text" name="txtnitempresa" readonly="" value="<%= rs.getInt("NitEmpresa")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Razon Social:</label>
                        <input type="text" name="txtrazonsocial" value="<%= rs.getString("razonSocial")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Direccion:</label>
                        <input type="text" name="txtdireccion" value="<%= rs.getString("direccion")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Numero Telefonico:</label>
                        <input type="text" name="txtnumerotelefonico" value="<%= rs.getString("numeroTelefonico")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="txtcelular" value="<%= rs.getString("celular")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Estado de Servicio:</label>
                        <input type="text" name="txtestado" value="<%= rs.getBoolean("EstadoServicio")%>" class="form-control">
                    </div>
                    
                    <input class="btn btn-success" type="submit" name="btnEditarEmpresaVigilancia" value="Guardar Datos">
                    
                    <input class="btn btn-warning" name="btnDevolver" value="Volver" onclick=window.location='EmpresaAseo.jsp' >
                </div>
              <% }%>
            </form>
    </body>
</html>
<%
    String nit;
    String razon, dir, numero, cel, estado;
    nit=request.getParameter("txtnitempresa");
    
    razon=request.getParameter("txtrazonsocial");
    dir=request.getParameter("txtdireccion");
    numero=request.getParameter("txtnumerotelefonico");
    cel=request.getParameter("txtcelular");
    estado=request.getParameter("txtestado");
    
    if(razon!=null && nit!=null && dir!=null && numero!=null && cel!=null && estado!=null){
        ps=con.prepareStatement("update empresaAseo set razonSocial='"+razon+"', direccion='"+dir+"', numeroTelefonico='"+numero+"', celular='"+cel+"', EstadoServicio='"+estado+"'WHERE NitEmpresa="+nit);

        ps.executeUpdate();
        response.sendRedirect("EmpresaAseo.jsp");
    }
%>
