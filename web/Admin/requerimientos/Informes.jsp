<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="VO.PdfVO"%>
<%@page import="DAO.PdfDAO"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.util.List"%>
<%@page import="clases.FormularioEmpresadeVigilancia"%>
<%@page import="clases.Acceso"%>
<%@page import = "java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <link rel="stylesheet" href="../../Recursos/css/estilos.css" type="text/css" media="screen"/>
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
    <h3 class="heading">Informes publicados en el conjunto:</h3>
    <hr>

    <%
        PdfDAO emp = new PdfDAO();
        PdfVO pdfvo = new PdfVO();
        ArrayList<PdfVO> listar = emp.Listar_PdfVO();
    %>
    <body background="../../Recursos/img/12.jpeg">
    <div class="datagrid">
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Pdf</th>
                    <th></th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="4">
                        <div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul>
                        </div>
                </tr>
            </tfoot>
            <tbody>
                <%if (listar.size() > 0) {
                        for (PdfVO listar2 : listar) {
                            pdfvo = listar2;
                %>
                <tr>
                    <td><%=pdfvo.getNombrepdf()%></td>
                    <td>
                        <%
                            if (pdfvo.getArchivopdf2() != null) {
                        %>
                        
                        <a href="pdf?id=<%=pdfvo.getCodigopdf()%>" target="_blank"><img src="../../Recursos/img/mpdf.png" title="pdf"/></a>
                            <%
                                } else {
                                    out.print("Vacio");
                                }
                            %>
                    </td>
                    <td>
                        <a id="mostrar" href="ControllerPdf?action=insert&id=<%=pdfvo.getCodigopdf()%>"> <img src="../../Recursos/img/nuevo.png" title="Nuevo registro"/></a>-
                        <a href="ControllerPdf?action=edit&id=<%=pdfvo.getCodigopdf()%>"> <img src="../../Recursos/img/editar.png" title="Modificar"/></a>-
                        <a href="ControllerPdf?action=delete&id=<%=pdfvo.getCodigopdf()%>"> <img src="../../Recursos/img/delete.png" title="Eliminar"/></a>
                    </td>
                </tr>
                <%}
                    }%>
            </tbody>
        </table>
    </div>
</body>
</html>
