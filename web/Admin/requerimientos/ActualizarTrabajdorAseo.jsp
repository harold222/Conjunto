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
            
            int id=Integer.parseInt(request.getParameter("Cedula"));
            ps=con.prepareStatement("select * from TrabajadorEmpresaAseo where cedula="+id);
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
                        <label>Cedula:</label>
                        <input type="text" name="txtcedula" readonly="" value="<%= rs.getInt("cedula")%>" class="form-control">
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
                        <label>direccion:</label>
                        <input type="text" name="txtdireccion" value="<%= rs.getString("direcciones")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input type="text" name="txttelefono" value="<%= rs.getString("telefono")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="txtcelular" value="<%= rs.getString("celulares")%>" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Estado:</label>
                        <input type="text" name="txtestado" value="<%= rs.getBoolean("estado")%>" class="form-control">
                    </div>
                    
                    <input class="btn btn-success" type="submit" name="btnEditarEmpresaVigilancia" value="Guardar Datos">
                    
                    <input class="btn btn-warning" name="btnDevolver" value="Volver" onclick=window.location='EmpresaAseo.jsp' >
                </div>
              <% }%>
            </form>
    </body>
</html>
<%
    String ced,nom,ape,dir,tel,cel,estado;
    ced=request.getParameter("txtcedula");
    nom=request.getParameter("txtnombre");
    ape=request.getParameter("txtapellido");
    dir=request.getParameter("txtdireccion");
    tel=request.getParameter("txttelefono");
    cel=request.getParameter("txtcelular");
    estado=request.getParameter("txtestado");
    
    if(ced!=null && nom!=null && ape!=null && dir!=null && tel!=null && cel!=null){
        ps=con.prepareStatement("update TrabajadorempresaAseo set nombre='"+nom+"', apellido='"+ape+"', direcciones='"+dir+"', telefono='"+tel+"', celulares='"+cel+"', Estado='"+estado+"'WHERE Cedula="+ced);

        ps.executeUpdate();
        response.sendRedirect("EmpresaAseo.jsp");
    }
%>

