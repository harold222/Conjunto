<%-- 
    Document   : Pagina2
    Created on : 19/12/2017, 04:00:50 PM
    Author     : David
--%>

<%@page import="VO.PdfVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../Recursos/css/estilos.css" type="text/css" media="screen"/>
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Integer dato = 0;
            try {
                PdfVO pdf = (PdfVO) request.getAttribute("row");
                dato = pdf.getCodigopdf();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>

        <form name="formpdf" action="ControllerPdf" method="post" enctype="multipart/form-data">
            <div class="datagrid">
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Campo</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>
                                <label for="id">Nombre del archivo: </label>
                            </td>  
                            <td>
                                <input type="text" name="txtname" value="<c:out value="${row.nombrepdf}" />" />
                            </td>
                        </tr>
                        <tr class="alt">
                            <td>
                                <label for="id">Seleccionar PDF: *</label>
                                <%
                                    if (icono) {
                                %>
                                <a href="pdf?id=<%out.print(dato); %>" target="_blank"> Ver Pdf</a>
                                <%
                                    } else {
                                        out.print("No hay Pdf");
                                    }
                                %>
                            </td>  
                            <td>
                                <input type="file" name="fichero" value="" class="btn"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center"><input type="submit" value="Publicar informe" name="submit" id="btn" class="btn"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
                            <a href="Informes.jsp">Regresar</a>
    </body>
</html>
