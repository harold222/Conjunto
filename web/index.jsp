<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
    "http://www.w3.org/TR/html4/loose.dtd">
 
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<!-- Librerias para rich faces-->
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%><!-- libreria Ajax-->
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%><!-- libreria RichFaces-->
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
<view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <link href="Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
            <title>Software Conjunto Cerrado</title>
        </head>
        
        <body background="Recursos/img/16.jpg">
            <form action="SERVLOGIN" method="post">
                
                <div class="container col-lg-3">
                    <div class="form-group text-center">
                        <img src="Recursos/img/2.jpg" height="150" width="150"/>
                        <p><h3 class="bb">Sistema Login</h3></p><br>
                    </div>
                
                    <div class="form-group">
                        <label class="bienvenida">Identificacion</label>
                        <input type="text" name="txtidentificacion" placeholder="Ingrese su identificacion" class="form-control">
                    </div>
                
                    <div class="form-group">
                        <label class="bienvenida">Contraseña</label>
                        <input type="password" name="txtcontra" placeholder="Ingrese su clave" class="form-control"><br>
                    </div>
                
                    <input class="btn btn-success" type="submit" name="btnIniciar" value="Iniciar Sesion" onclick=edit()>
                    <input class="btn btn-warning" type="submit" name="btnRegistrarme" value="Registrarme" onclick="Registrarme.jsp" >
                </div>
                
            </form>
            
            <script>
                function edit(){
                    alert('Ha iniciado Sesion en nuestro sistema');
                }
            </script>
         
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