<%-- 
    Document   : resident
    Created on : 18-may-2019, 15:28:29
    Author     : HarolD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<!-- RichFaces tag library declaration -->

<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<%
    HttpSession sesion = request.getSession();
    
    if (sesion.getAttribute("nivel") == null) { //es deicr que no ha estado por el formulario
        response.sendRedirect("../index.jsp");
    }else{
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("2")) {
            response.sendRedirect("../index.jsp");
        }
    }
%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="../Recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Software Conjunto</title>
    </head>
    
    <body>
        
        <nav class="navbar navbar-dark bg-dark">
            
            <a style="color: white" class="nav-link dropdown-toggle" data-toggle="dropdown">Software Conjunto</a>
                
            <div class="dropdown-menu text-center">
                
                <a style="color: blue" href="#" >Inicio</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Noticias</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Eventos</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Enviar correo</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Salon comunal</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Informes</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#" >Cartelera social</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="#">Empresa de Aseo</a><br>
                <div class="dropdown-divider"></div>
                <a style="color: blue" href="requerimientos/EmpresaVigilancia.jsp" >Empresa de Vigilancia</a><br>

            </div>

            <div class="dropdown">
                <a style="color: white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesion</a>
                
                <div class="dropdown-menu text-center">
                    <a><img src="../Recursos/img/4.png" height="100" width="80"/></a><br>
                    <a><%= sesion.getAttribute("nombre")%> </a><br>
                    <a><%= sesion.getAttribute("correo")%> </a><br>
                    <a>Residente nivel 2</a>
                    <div class="dropdown-divider">
                        
                    </div>
                    <a style="color: black" href="../index.jsp?cerrar=true" class="dropdown-item">Actualizar datos</a>
                    <a style="color: black" href="../index.jsp?cerrar=true" class="dropdown-item">Salir</a>
                </div>
                
            </div>
            
        </nav>
                    
        <div class="container mt-4">
            <h1>Noticas:</h1>          
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        
        
    </body>
</html>
