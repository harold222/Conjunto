<%-- 
    Document   : Actualizar perfil
    Created on : 28-may-2019, 22:48:11
    Author     : Harold Pedraza
    Esta pagina sera la encargada de permitirme enviar correos al administrador del conjunto.
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
    <h3 class="heading">Enviar correo al administrador: </h3>
    <hr>
    
    <%
    HttpSession sesion = request.getSession();
    %>
    
    <body background="../../Recursos/img/26.jpg">
        
        <form action="resultado.jsp" method="post">
            <table class="table table-striped">
                  
                <tr>
                    <td class="mejor">Identificacion Remitente:</td>
                    <td><input type="text" name="identificacion" readonly="" value="<%= sesion.getAttribute("identificacion")%>" class="form-control"/></td>
                </tr>
                
                <tr>
                    <td class="mejor">Remitente:</td>
                    <td><input type="text"name="remitente" readonly="" value="<%= sesion.getAttribute("correo")%>" class="form-control"/></td>
                </tr>
               
                <tr>
                    <td class="mejor">Contraseña del correo:</td>
                    <td><input type="password" name="clave" class="form-control" required=""/></td>
                </tr>
                
                <tr>
                    <td class="mejor">Asunto:</td>
                    <td><input type="text" name="asunto" class="form-control" required/></td>
                </tr>
                   
                <tr>
                    <td class="mejor">Destinatario:</td>
                    <td><input type="text" name="destinatario" value="t1harolo@gmail.com" readonly="" class="form-control" required/></td>
                </tr>
                  
                <tr>
                    <td class="mejor">Torre:</td>
                    <td><input type="text" name="torre" class="form-control" required/></td>
                </tr>
                    
                <tr>
                    <td class="mejor">Apartamento:</td>
                    <td><input type="text" name="apartamento" class="form-control" required/></td>
                </tr>   
                    
                <tr>
                    <td class="mejor">Mensaje:</td>
                    <td><textarea name="mensaje" cols="40" rows="10"></textarea></td>
                </tr>
                   
                <tr>
                    <td></td>
                    <td><input class="btn btn-success" type="submit" value="Enviar correo a administrador"></td>
                </tr> 
                
            </table>
             
        </form>
    </body>
</html>
