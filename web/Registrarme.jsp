<%-- 
    Document   : Registrarme
    Created on : 18-may-2019, 22:48:11
    Author     : HarolD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<!-- RichFaces tag library declaration -->
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%><!-- libreria Ajax-->
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%><!-- libreria RichFaces-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Registrarme</title>
    </head>
    <body>
            
            <form action="SERVREGISTROS" method="post">
                
                <div class="container col-lg-3">
                    
                    <div class="form-group text-center">
                        <img src="Recursos/img/5.png" height="150" width="150"/>
                        <p><strong>Formulario de registro</strong></p>
                        <hr>
                    </div>
                    
                    <div class="form-group">
                        <label>Identificacion:</label>
                        <input type="text" name="txtidentificacion" placeholder="Ingrese su identificacion" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input type="text" name="txtnombre" placeholder="Ingrese su nombre" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Apellido:</label>
                        <input type="text" name="txtapellido" placeholder="Ingrese su apellido" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Correo:</label>
                        <input type="text" name="txtcorreo" placeholder="Ingrese su Correo electronico" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="txtcelular" placeholder="Ingrese su celular" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input type="text" name="txttelefono" placeholder="Ingrese su telefono" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Contraseña:</label>
                        <input type="password" name="txtclave" placeholder="Ingrese su clave" class="form-control">
                    </div>
                    
                    <input class="btn btn-success" type="submit" name="btnRegistros" value="Registrarse">
                    <input class="btn btn-warning" type="submit" name="btnindex" value="Volver" onclick="index.jsp" >
                </div>
                
            </form>

    </body>
</html>
