<%-- 
    Document   : Actualizar perfil
    Created on : 28-may-2019, 22:48:11
    Author     : Harold Pedraza
    Esta pagina sera la encargada de mostrarme en formato tabla los datos pertenecientes
    a los trabajadores de una determinada empresa de aseo en el conjunto.
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="clases.FormularioEmpresadeVigilancia"%>
<%@page import="clases.Acceso"%>
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
    <h3 class="heading">Trabajadores existentes en la Empresa de Aseo: </h3>
    <hr>
    
    <body background="../../Recursos/img/8.jpg" >
        
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
            int nit=Integer.parseInt(request.getParameter("NitEmpresa"));
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("SELECT nitempresa,cedula,nombre,apellido,direcciones,telefono,celulares,estado FROM EmpresaAseo INNER JOIN TrabajadorEmpresaAseo ON EmpresaAseo.nitempresa = TrabajadorEmpresaAseo.NitDeEmpresa WHERE NitEmpresa ="+nit+";");
             
        %>
        
        <div >
            
            <table  class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Nit Empresa: </th>
                    <th scope="col">Cedula: </th>
                    <th scope="col">Nombre: </th>
                    <th scope="col">Apellido: </th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Telefono: </th>
                    <th scope="col">Celular: </th>
                    <th scope="col">Estado de Servicio: </th>
                    <th scope="col">Acciones: </th>
                </tr>
                </thead>
                  
                <% while(rs.next()){ %>
                
                <tr>
                    <th scope="row"> <%= rs.getInt("NitEmpresa")%> </th>
                    <th scope="row"> <%= rs.getInt("cedula")%> </th>
                    <th scope="row"> <%= rs.getString("nombre")%> </th>
                    <th scope="row"> <%= rs.getString("apellido")%> </th>
                    <th scope="row"> <%= rs.getString("direcciones")%> </th>
                    <th scope="row"> <%= rs.getString("telefono")%> </th>
                    <th scope="row"> <%= rs.getString("celulares")%> </th>
                    <th scope="row"> <%= rs.getBoolean("estado")%> </th>
                    
                    <th scope="row">
                        <a class="btn btn-warning btn-sm" href="EmpresaAseo.jsp">Devolver</a>
                    </th>                  
                </tr>
                <% }%>
                
            </table>
        </div>
    </body>
</html>



