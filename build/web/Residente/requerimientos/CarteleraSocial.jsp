<%-- 
    Document   : Actualizar perfil
    Created on : 28-may-2019, 22:48:11
    Author     : Harold Pedraza
    Esta pagina sera la encargada de mostrarme en forma de tabla una cartelera con atributos
    ya dados.
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
    <h3 class="heading">Contenido Cartelera Social: </h3>
    <hr>
    
    <body background="../../Recursos/img/9.png" >
        
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
            rs = smt.executeQuery("select * from CarteleraSocial");
             
        %>
        
        <div >
            
            <table class="table">
                
                <thead class="thead-dark">
                    <tr >
                        <th scope="col">Nombre de la cartelera</th>
                        <th scope="col">Contenido de la cartelera</th>
                    </tr>
                </thead>
                  
                <% while(rs.next()){ %>
                
                <tr >
                    <th scope="row"> <%= rs.getString("NombreCartelerasocial")%> </th>
                    <th scope="row"> <%= rs.getString("ContenidoCartelerasocial")%> </th>
                </tr>
               <% }%>
                
            </table>
        </div>
    </body>
</html>
