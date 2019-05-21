<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<!-- RichFaces tag library declaration -->
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%><!-- libreria Ajax-->
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%><!-- libreria RichFaces-->
 
<view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <link href="Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
            <title>Software Conjunto Cerrado</title>
        </head>
        
        <body>
            <form action="SERVLOGIN" method="post">
                
                <div class="container col-lg-3">
                    <div class="form-group text-center">
                        <img src="Recursos/img/2.jpg" height="150" width="150"/>
                        <p><strong>Sistema Login</strong></p>
                    </div>
                
                    <div class="form-group">
                        <label>Identificacion:</label>
                        <input type="text" name="txtidentificacion" placeholder="Ingrese su identificacion" class="form-control">
                    </div>
                
                    <div class="form-group">
                        <label>Contraseña:</label>
                        <input type="password" name="txtcontra" placeholder="Ingrese su clave" class="form-control"><br>
                    </div>
                
                    <input class="btn btn-success" type="submit" name="btnIniciar" value="Iniciar Sesion">
                    <input class="btn btn-warning" type="submit" name="btnRegistrarme" value="Registrarme" onclick="Registrarme.jsp" >
                </div>
                
            </form>
            
            <form action="Registrarme.jsp" method="post">
                
            </form>
            
            
            
            <%
                HttpSession sesion = request.getSession();    
                int nivel = 0;
                
                if(request.getAttribute("nivel") != null){
                    nivel = (Integer)request.getAttribute("nivel");
                    
                    if(nivel == 1){//administrador
                        sesion.setAttribute("identificacion", request.getAttribute("identificacion")); //creo la sesion
                        sesion.setAttribute("nivel", nivel);
                        sesion.setAttribute("nombre", request.getAttribute("nombre"));
                        sesion.setAttribute("correo", request.getAttribute("correo"));
                        response.sendRedirect("Admin/admin.jsp");
                    }else if(nivel == 2){
                        sesion.setAttribute("identificacion", request.getAttribute("identificacion")); //creo la sesion
                        sesion.setAttribute("nivel", nivel);
                        sesion.setAttribute("nombre", request.getAttribute("nombre"));
                        sesion.setAttribute("correo", request.getAttribute("correo"));
                        response.sendRedirect("Residente/resident.jsp");
                    }
                }
                
                if(request.getParameter("cerrar") != null){
                    session.invalidate();
                }
            %>
        </body>
        
    </html>
</view>