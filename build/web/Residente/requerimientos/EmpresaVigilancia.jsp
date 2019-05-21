<%-- 
    Document   : EmpresaVigilancia
    Created on : 20-may-2019, 22:37:50
    Author     : HarolD
--%>


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
    
    <h1>Empresa Vigilancia: </h1>
    <h3>Formulario Empresa Vigilancia: </h3>
    
    <body>
        <form action="SERVEMPRESVIGILANCIA" method="post">
                
                
                <table>
                    
                    <tr>
                        <th>Nit Empresa: </th>
                        <th>Razon Social: </th>
                        <th>Direccion: </th>
                        <th>Numero Telefonico</th>
                        <th>Celular: </th>
                        <th>Estado de Servicio: </th>
                    </tr>
                    
                    <%
                        LinkedList<FormularioEmpresadeVigilancia> lista = Acceso.FormularioEmpresaVigi();
                        
                        for (int i=0;i<lista.size();i++){
                            out.println("<tr>");
                            out.println("<td>"+lista.get(i).getNitempresa()+"</td>");
                            out.println("<td>"+lista.get(i).getRazonsocial()+"</td>");
                            out.println("<td>"+lista.get(i).getDireccion()+"</td>");
                            out.println("<td>"+lista.get(i).getNumerotelefonico()+"</td>");
                            out.println("<td>"+lista.get(i).getCelular()+"</td>");
                            out.println("<td>"+lista.get(i).getEstadoServicio()+"</td>");
                            out.println("</tr>");
                        }
                    %>
                    
                </table>
                

            
        </form>
    </body>
</html>
