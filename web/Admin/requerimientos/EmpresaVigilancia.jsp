<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.util.List"%>
<%@page import="clases.FormularioEmpresadeVigilancia"%>
<%@page import="clases.Acceso"%>
<%@page import = "java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <link href="../../Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
    <jsp:include page='partials/header.jsp'>
        <jsp:param name='title' value='Welcome' />
    </jsp:include>
    <style>
        .heading { 
            color: #CA4F24;
            font-size: 200%;
            font-weight: bold;
            letter-spacing: 10px;
            text-align: center;
            text-shadow: gray 3px 0;
            text-transform: uppercase;
        }
        
        
    </style>
    
    <br>
    <h3 class="heading">Formulario Empresa de Vigilancia: </h3>
    <hr>
    
    <body background="../../Recursos/img/7.jpg" >
        
        <%
            Connection con;
            String url = "jdbc:mysql://localhost:3306/ingsoftware";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from empresavigilancia");
             
        %>
        
        <div >
            
          
            <table  class="table table-striped">
                <tr>
                    <th scope="col">Nit Empresa: </th>
                    <th scope="col">Razon Social: </th>
                    <th scope="col">Direccion: </th>
                    <th scope="col">Numero Telefonico</th>
                    <th scope="col">Celular: </th>
                    <th scope="col">Estado de Servicio: </th>
                    <th scope="col">Acciones: </th>
                </tr>
                  
                <% while(rs.next()){ %>
                
                <tr>
                    <th scope="row"> <%= rs.getInt("NitEmpresa")%> </th>
                    <th scope="row"> <%= rs.getString("razonSocial")%> </th>
                    <th scope="row"> <%= rs.getString("direccion")%> </th>
                    <th scope="row"> <%= rs.getString("numeroTelefonico")%> </th>
                    <th scope="row"> <%= rs.getString("celular")%> </th>
                    <th scope="row"> <%= rs.getBoolean("EstadoServicio")%> </th>
                    
                    <th scope="row">
                        <a class="btn btn-warning btn-sm" href="ActualizarEmpresaVigilancia.jsp?NitEmpresa=<%= rs.getInt("NitEmpresa")%>">Actualizar datos</a>
                        <a class="btn btn-warning btn-sm" href="TrabajadoresEmpresaVigi.jsp?NitEmpresa=<%= rs.getInt("NitEmpresa")%>">Trabajadores Existentes</a>
                    </th>                  
                </tr>
                <% }%>
                
            </table>
        </div>
    </body>
</html>
