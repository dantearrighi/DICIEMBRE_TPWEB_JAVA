<%@page import="negocio.Alumno"%>
<%@page import="negocio.Docente"%>
<%@page import="negocio.ControladorSGA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Modificacion Datos Personales Alumno</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-slate.css">
  <link rel="stylesheet" href="css/bootstrap-responsive.css">
  <link href="css/charisma-app.css" rel="stylesheet">
  <link rel="stylesheet" href="css/estilos.css">
<style type="text/css">
    body {
    padding-bottom: 40px;
    }
    .sidebar-nav {
    padding: 9px 0;
    }
  </style>
</head>
<body>
<%
if(session.getAttribute("usuario")==null){ 
	response.sendRedirect("login.jsp");
	
	} 
else {
String usu= (String)session.getAttribute("usuario");
Alumno alumno=(Alumno)request.getAttribute("alumno");
%>
 
<div class="navbar">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="index.jsp"> <span>SGA</span></a>
        <div class="mi_barra">
        	<h3>Sistema de Gestion de Alumnos UNR-ARTE</h3>
        </div>
        
        <!-- theme selector starts -->
        <div class="btn-group pull-right theme-container" >
         <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="icon-user"></i><span class="hidden-phone"> <%=usu %></span>
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a type="button" href="login.jsp">Cerrar Sesion</a></li>
          </ul>
        </div>
        
        
      </div>
    </div>
  </div>
  <!-- topbar ends -->





<div class="container-fluid">
    <div class="row-fluid">
        
      <!-- left menu starts -->
      <div class="span2 main-menu-span">
        <div  class="well nav-collapse sidebar-nav">
          <ul id="pruebita" class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">Menu Principal</li>
            <li><a href="CargaAsistencias.jsp"><i class="icon-font"></i> Cargar Asistencias</a>           
            </li>
            <li><a class="ajax-link"><i class="icon-list-alt"></i><span class="hidden-tablet"> Listados</span></a>
            <ul>
                <li><a class="ajax-link" href="ListadoDatosAlu.jsp">Datos Alumnos</a></li>
                <li><a class="ajax-link" href="ListadoAsistencias.jsp">Asistencias</a></li>
                <li><a class="ajax-link" href="ListadoParciales.jsp">Parciales</a></li>
                <li><a class="ajax-link" href="ListadoTP.jsp">Trabajos Practicos</a></li>
              </ul>
            </li>
            <li><a class="ajax-link" href="CargaParciales.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> Cargar Notas Parciales</span></a></li>
            <li><a class="ajax-link" href="CargaTP.jsp"><i class="icon-file"></i><span class="hidden-tablet"> Cargar notas TP</span></a></li>
            <li><a class="ajax-link" href="ModificarAlu.jsp"><i class="icon-pencil"></i><span class="hidden-tablet"> Modificar Datos Alumnos</span></a>
            </li>
            <li><a class="ajax-link" href="ModificarDatosDoc.jsp"><i class="icon-refresh"></i><span class="hidden-tablet"> Modificar Datos Docente</span></a></li>
            <li><a class="ajax-link"><i class="icon-remove"></i><span class="hidden-tablet"> Dar de baja</span></a>
            <ul>
                <li><a class="ajax-link" href="EliminaAlu.jsp">Alumno</a></li>
                <li><a class="ajax-link" href="EliminarComi.jsp">Curso</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <!-- left menu ends -->
    <div id="content" class="span10">
      <!-- content starts -->
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> Modificar Datos Personales</h2>
            <div class="box-icon">
              <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
              <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
              <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
          </div>
          <div class="box-content">
            <form name="datos" action="/ServletModAluPers"  class="form-horizontal" method="post" onsubmit="return validar();">
								<fieldset>
							 		
							 		<div class="control-group">
							  			<label class="control-label" for="nombre">Nombre:</label>
							 				 <div class="controls">
												<input  type="text" id="nombre" name="nombre" maxlength="50" value="<%=alumno.getNombre()%>"/>
							  				</div>
									</div>
                                 
                                 	<div class="control-group">
							  			<label class="control-label" for="apellido">Apellido:</label>
							 				 <div class="controls">
												<input  type="text" id="apellido" name="apellido"  maxlength="50" value="<%=alumno.getApellido() %>" />
							  				</div>
									</div>
									
									<div class="control-group">
							  			<label class="control-label" for="legajo">Legajo:</label>
							 				 <div class="controls">
												<input style="background-color:white; color:black;" type="text" id="legajo" name="legajo" maxlength="50" value="<%=alumno.getLegajo()%>" readonly/>
							  				</div>
									</div>
									
									<div class="control-group">
							  			<label class="control-label" for="mail">Email:</label>
							 				 <div class="controls">
												<input type="text" id="mail" name="mail" maxlength="50" value="<%=alumno.getMail()%>"/>
							  				</div>
									</div>
									
									<div class="control-group">
							  			<label class="control-label" for="obs">Observaciones:</label>
							 				 <div class="controls">
												<input type="text" id="obs" name="obs" maxlength="50" value="<%=alumno.getObservacion()%>"/>
							  				</div>
									</div>
                                       
                                       
                                            
                                    <div class="form-actions">
							  			<button type="submit" class="btn btn-primary">Registrar</button>
										<button type="reset" class="btn">Cancelar</button>
									</div>
                                        

                                           
                                           
								</fieldset>

						</form>
        </div>
      </div>
      </div>
      </div>
  </div>

  <script src="js/jquery-1.7.2.min.js"></script>
  <script src="js/jquery.cookie.js"></script>
  <script src="js/jquery.history.js"></script>
  <script src="js/charisma.js"></script>




  <!-- jQuery UI -->
  <script src="js/jquery-ui-1.8.21.custom.min.js"></script>
  <!-- transition / effect library -->

  <!-- custom dropdown library -->
  <script src="js/bootstrap-dropdown.js"></script>
  <!-- scrolspy library -->
  
  <!-- library for creating tabs -->
  <script src="js/bootstrap-tab.js"></script>
  <!-- library for advanced tooltip -->
  <script src="js/bootstrap-tooltip.js"></script>
  <!-- popover effect library -->
  <script src="js/bootstrap-popover.js"></script>
  <!-- button enhancer library -->
  <script src="js/bootstrap-button.js"></script>
  <!-- accordion library (optional, not used in demo) -->
  <script src="js/bootstrap-collapse.js"></script>
  <!-- carousel slideshow library (optional, not used in demo) -->
 
  <!-- autocomplete library -->
  <script src="js/bootstrap-typeahead.js"></script>
  <!-- tour library -->
  <script src="js/bootstrap-tour.js"></script>
  <!-- library for cookie management -->
<script src="js/jquery.chosen.min.js"></script>
  <!-- checkbox, radio, and file input styler -->
  <script src="js/jquery.uniform.min.js"></script>
  <!-- plugin for gallery image view -->
  <script src="js/jquery.colorbox.min.js"></script>
  <!-- rich text editor library -->
  <script src="js/jquery.cleditor.min.js"></script>
  <!-- notification plugin -->
  <script src="js/jquery.noty.js"></script>
  <!-- file manager library -->
  <script src="js/jquery.elfinder.min.js"></script>
  <!-- star rating plugin -->
  <script src="js/jquery.raty.min.js"></script>
  <!-- for iOS style toggle switch -->
  <script src="js/jquery.iphone.toggle.js"></script>
  <!-- autogrowing textarea plugin -->
  <script src="js/jquery.autogrow-textarea.js"></script>
  <!-- multiple file upload plugin -->
  <script src="js/jquery.uploadify-3.1.min.js"></script>
  <!-- history.js for cross-browser state change on ajax -->
  <!-- calander plugin -->
  <script src='js/fullcalendar.min.js'></script>
  <!-- data table plugin -->
  <script src='js/jquery.dataTables.min.js'></script>

  <%} %>
  <script>
  function validar()
  {
      var fallo = false;
      var falta = "";
      var formato = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
     
      if (datos.nombre.value == "") {
          falta += "Falta su Nombre \n";
          fallo = true;
      }

      if (datos.apellido.value == "") {
          falta += "Falta apellido \n";
          fallo = true;
      }

      var v_email = formato.test(datos.mail.value);

      if ((v_email != true) || (datos.mail.value == "")) {
          falta += "E-Mail no válido \n";
          fallo = true;
      }

      if (datos.obs.value == "") {
          falta += "Faltan observaciones \n";
          fallo = true;
      }

      if (fallo) {
          alert(falta);
          return false;
      }
      else { 
          return true;
      }
  }
  </script>
</body>
</html>