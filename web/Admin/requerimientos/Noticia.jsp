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
            color: #000000;
            font-size: 200%;
            font-weight: bold;
            letter-spacing: 10px;
            text-align: center;
            text-shadow: gray 3px 0;
            text-transform: uppercase;
        }
        
        
    </style>
    
    <br>
    <h3 class="heading">Noticias del conjunto: </h3>
    <hr>
    
    <body background="../../Recursos/img/13.jpg" >
        
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
            rs = smt.executeQuery("select * from Noticia");
             
        %>
        
        <div >
            
          <a class="btn btn-success" href="AgregarNoticia.jsp">Agregar Nueva noticia</a>
          
            <table class="table table-striped">
                
                  
                <% while(rs.next()){ %>
                
                <tr >
                    <th scope="row"> <%= rs.getString("NombreNoticia")%> </th>
                    <th scope="row"> <%= rs.getString("ContenidoNoticia")%> </th>
                    
                    <th scope="row">
                        <a class="btn btn-warning btn-sm" href="ActualizarNoticia.jsp?cod=<%= rs.getInt("identificador")%>">Editar Noticia</a>
                    </th>                  
                </tr>
                
                <% }%>
                
            </table>
        </div>
    </body>
</html>
