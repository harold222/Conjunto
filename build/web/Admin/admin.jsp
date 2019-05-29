<%-- 
    Document   : admin
    Created on : 18-may-2019, 15:27:44
    Author     : HarolD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("nivel") == null) { //es deicr que no ha estado por el formulario
        response.sendRedirect("../index.jsp");
    }else{
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("1")) {
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
    
    <body background="../Recursos/img/17.jpg"> 
        
        <nav class="navbar navbar-dark bg-dark">
            
            <a style="color: white" class="nav-link dropdown-toggle" data-toggle="dropdown"></a>
                
            

            <div class="dropdown">
                <a style="color: white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesion</a>
                
                <div class="dropdown-menu text-center">
                    <a><img src="../Recursos/img/3.png" height="100" width="80"/></a><br>
                    <a><%= sesion.getAttribute("nombre")%> </a><br>
                    <a><%= sesion.getAttribute("correo")%> </a><br>
                    <a>Administrador nivel 1</a>
                    <div class="dropdown-divider">
                        
                    </div>
                    <a style="color: black" href=requerimientos/ActualizarPerfil.jsp?id=<%= sesion.getAttribute("identificacion")%> class="dropdown-item">Actualizar datos</a>
                    <a style="color: black" href="../index.jsp?cerrar=true" class="dropdown-item">Salir</a>
                </div>
                
            </div>
            
        </nav>
                    
        <div class="container mt-4">
            <h1 class="as">Bienvenido al Software del conjunto</h1>          
        </div>
        
        <div class="bodyy">
            
            <div class="izquierda">
                <div align="center">Haz click aqui para enterarte de las noticias actuales de nuestro conjunto.</div>
                <br>
                <div align="center"><img src="../Recursos/img/18.png" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><a class="button button5" href="requerimientos/Noticia.jsp" >Noticias</a></div>
            </div>
            
            <div class="centro">
                <div align="center">Enterate de los proximos eventos a realizar dentro de nuestro conjunto.</div>
                <br>
                <div align="center"><img src="../Recursos/img/19.png" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><a class="button button5" href="requerimientos/Evento.jsp" >Eventos</a><br></div>
            </div>
            
            <div class="derecho">
                <div align="center">Deseas dejar algun mensaje al residente de nuestro conjunto?</div>
                <br>
                <div align="center"><img src="../Recursos/img/20.png" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><div align="center"></div><a class="button button5" href="requerimientos/EnvioCorreo.jsp" >Enviar correo</a><br></div>
            </div>
            
            <div class="izquierda">
                <div align="center">Deseas saber que informes han compartido en el conjunto?</div>
                <br>
                <div align="center"><img src="../Recursos/img/21.png" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><a class="button button5" href="requerimientos/Informes.jsp" >Informes</a><br></div>
            </div>
            
            <div class="centro">
                <div align="center">Haz click aqui para saber la cartelera programada en fechas proximas.</div>
                <br>
                <div align="center"><img src="../Recursos/img/22.gif" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><a class="button button5" href="requerimientos/CarteleraSocial.jsp" >Cartelera social</a><br></div>
            </div>
            
            <div class="derecho">
                <div align="center">Investiga todo lo referente a las empresas de aseo asociadas a nuestro conjunto.</div>
                <br>
                <div align="center"><img src="../Recursos/img/23.gif" alt="" height="150" width="150" /></div>

                <div align="center"><a class="button button5" href="requerimientos/EmpresaAseo.jsp">Empresa de Aseo</a><br></div>
            </div>
            
            <div class="izquierda">
                <div align="center">Investiga todo lo referente a las empresas de vigilancia asociadas a nuestro conjunto.</div>
                <br>
                <div align="center"><img src="../Recursos/img/24.gif" alt="" height="150" width="150" /></div>
                
                <div align="center"><a class="button button5" href="requerimientos/EmpresaVigilancia.jsp" >Empresa de Vigilancia</a><br></div>
            </div>
            
            <div class="centro">
                <div align="center">Deseas mas informacion acerca de nuestro salon comunal?</div>
                <br>
                <div align="center"><img src="../Recursos/img/25.png" alt="" height="150" width="150" /></div>
                <br>
                <div align="center"><a class="button button5" href="#" >Salon comunal</a><br></div>
            </div>
        </div>  
                    
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        
        
    </body>
</html>