<%@page import="negocio.ControladorTelevisorNegocio"%>
<%@page import="models.Televisor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Modificar datos - Televisor</title>
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
if(session.getAttribute("usuario")==null)
{ 
	response.sendRedirect("login.jsp");
	
	} 
else {
String usu= (String)session.getAttribute("usuario");
Televisor Telev =(Televisor)request.getAttribute("teleSelect");

ControladorTelevisorNegocio controladorTelevisor = (ControladorTelevisorNegocio)session.getAttribute("controladorTelevisor");

%>
 
<div class="navbar">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="index.jsp"> <span>SGE</span></a>
        <div class="mi_barra">
        	<h3>Sistema de Gestion de Electrodomesticos </h3>
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
           

            <li><a class="ajax-link" href="ListaLavarropas.jsp"><i class="icon-remove"></i><span class="hidden-tablet">Cancelar</span></a></li>

            
          
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <!-- left menu ends -->
    <div id="content" class="span10">
      <!-- content starts -->
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> Modificar Datos </h2>
            <div class="box-icon">
              <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
              <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
              <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
          </div>
          <div class="box-content">
            <form name="datos" action="ServletModTelev"  class="form-horizontal" method="post" onsubmit="return validar();">
								<fieldset>


									<div class="control-group">
							  			<label class="control-label" for="id">ID:</label>
							 				 <div class="controls">
												<input style=" color:black;" type="text" id="id" name="id" maxlength="50" value="<%=Telev.getIdElect()%>" readonly/>
							  				</div>
									</div>
							 		
							 		
							 		<div class="control-group">
							  			<label class="control-label" for="oldconsumo">Consumo:</label>
							 				 <div class="controls">
												<input style=" color:black;" type="text" id="oldconsumo" name="oldconsumo" maxlength="50" value="<%=Telev.getConsumoEnergetico()%>" readonly/>
							  				</div>
									</div>
									
									<label class="control-label" for="consumo">Seleccionar nuevo Consumo energético</label>
								<div class="controls">
								  <p>
								    <select id="consumo" name="consumo">
								      <option value="A">A</option>
								      <option value="B">B</option>
								      <option value="C">C</option>
								      <option value="D">D</option>
								      <option value="E">E</option>
								      <option value="F">F</option>
							        </select>
							      </p>
								  <p>&nbsp;</p>
								</div>
									
									
                                 
                                 	<div class="control-group">
							  			<label class="control-label" for="oldcolor">Color:</label>
							 				 <div class="controls">
												<input style="color:black;" type="text" id="oldcolor" name="oldcolor" maxlength="50" value="<%=Telev.getColor()%>" readonly/>
							  				</div>
									</div>
									
									<label class="control-label" for="color">Seleccione nuevo Color</label>
								<div class="controls">
								  <p>
								    <select id="color" name="color">
								      <option value="blanco">Blanco</option>
								      <option value="negro">Negro</option>
								      <option value="azul">Azul</option>
								      <option value="rojo">Rojo</option>
								      <option value="gris">Gris</option>
								      
							        </select>
							      </p>
								  <p>&nbsp;</p>
								</div>

									<div class="control-group">
							  			<label class="control-label" for="oldResolucion">Resolucion:</label>
							 				 <div class="controls">
												<input style="color:black;" type="text" id="oldResolucion" name="oldResolucion" maxlength="50" value="<%=Telev.getPulgadas()%>" readonly/>
							  				</div>
									</div>
								
									<div class="control-group">
							  			<label class="control-label" for="resolucion">Nueva Resolucion:</label>
							 				 <div class="controls">
												<input type="text" id="resolucion" name="resolucion" maxlength="50" value="<%=Telev.getPulgadas()%>"/>
							  				</div>
									</div>
									
									<div class="control-group">
							  			<label class="control-label" for="oldSintoniz">Resolucion:</label>
							 				 <div class="controls">
												<input style="color:black;" type="checkbox" id="oldSintoniz" name="oldSintoniz" value="<%=Telev.getPulgadas()%>" readonly/>
							  				</div>
									</div>
								
									<div class="control-group">
							  			<label class="control-label" for="sintonizador">Nueva Resolucion:</label>
							 				 <div class="controls">
												<input type="checkbox" id="sintonizador" name="sintonizador" value="<%=Telev.isSintonizadorTDT()%>"/>
							  				</div>
									</div>
									

									<div class="control-group">
							  			<label class="control-label" for="descripcion">Descripcion:</label>
							 				 <div class="controls">
												<input style="background-color:white; color:black;" type="text" id="descripcion" name="descripcion" maxlength="50" value="<%=Telev.getDescripcion()%>" />
							  				</div>
									</div>							
									
									<div class="control-group">
							  			<label class="control-label" for="peso">Peso:</label>
							 				 <div class="controls">
												<input type="text" id="peso" name="peso" maxlength="50" value="<%=Telev.getPeso()%>"/>
							  				</div>
									</div>
									
									<div class="control-group">

							  			<label class="control-label" for="precio">Precio:</label>
							 				 <div class="controls">
												<input type="text" id="precio" name="precio" maxlength="50" value="<%=Telev.getPreciobase()%>"/>
							  				</div>
									</div>
                                       
                                       
                                            
                                    <div class="form-actions">
							  			<button type="submit" class="btn btn-primary">Guardar cambios</button>
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
          falta += "E-Mail no v�lido \n";
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