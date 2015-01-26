<%@page import="negocio.ControladorElectrodomesticoNegocio"%>
<%@page import="datos.CatalogoElectrodomestico"%>
<%@page import="models.Electrodomestico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Alta de Electrodomesticos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


 
 <link rel="stylesheet" type="text/css" href="css/bootstrap-slate.css">
  <link rel="stylesheet" href="css/bootstrap-responsive.css">
  <link href="css/charisma-app.css" rel="stylesheet">
  <link rel="stylesheet" href="css/estilos.css">
  <link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">


  
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
	response.sendRedirect("login.jsp");
else {
	String usu= (String)session.getAttribute("usuario");
	ArrayList <Electrodomestico> vListaElectros;
	ControladorElectrodomesticoNegocio controladorElectro = (ControladorElectrodomesticoNegocio)session.getAttribute("controladorElectro");
	   
    vListaElectros = controladorElectro.GetAllEl();
  
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
           
            <li><a class="ajax-link" href="ListaElectrodomesticos.jsp"><i class="icon-remove"></i><span class="hidden-tablet"> Cancelar</span></a></li>
            
          
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <!-- left menu ends -->
    <div id="content" class="span10">
      <!-- content starts -->
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> Alta de Electrodomestico</h2>
            <div class="box-icon">
              <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
              <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
              <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
          </div>
          <div class="box-content">
           <form name="datos" class="form-horizontal" action="/ServletAddElectro" method="post" onsubmit="return validar();">
              <div class="control-group">
								<label class="control-label" for="consumo">Consumo energético</label>
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
                                
                                	<label class="control-label" for="color">Color</label>
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
                                
                                
                                <div> 
                                 <label class="control-label" for="descripcion">Descripción</label>
                                 <div class="controls">
                                   <p>
                                     <input autofocus class="input-large span6" type="text" id="descripción" name="descripcion">		  
                                   </p>
                                   <p>&nbsp;</p>
                                 </div>
                                
                                </div>
                                
                                <div> 
                                 <label class="control-label" for="peso">Peso</label>
                                 <div class="controls">
                                   <p>
                                     <input autofocus class="input-large span2" type="text" id="peso" name="peso">		  
                                   </p>
                                   <p>&nbsp;</p>
                                 </div>
                                
                                </div>
                                
                                
                                <div> 
                                 <label class="control-label" for="precio">Precio</label>
                                 <div class="controls">
                                 <input autofocus class="input-large span2" type="text" id="precio" name="precio">		  
              					</div>
                                
                                </div>
                                
                                
                                
                                
                                
                                
                                
		     </div>
				
				</div>	
                
               
                 
          		<input type="submit" class="btn btn-primary" value="Registrar" />
            </form>
          </div>
        </div>
      </div>
      </div>
      </div>
  </div>

 

   <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery-1.7.2.min.js"></script>
   <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery-ui-1.8.21.custom.min.js"></script>




  <!-- jQuery UI -->
 
  <!-- transition / effect library -->

  <!-- custom dropdown library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-dropdown.js"></script>
  <!-- scrolspy library -->
  
  <!-- library for creating tabs -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-tab.js"></script>
  <!-- library for advanced tooltip -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-tooltip.js"></script>
  <!-- popover effect library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-popover.js"></script>
  <!-- button enhancer library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-button.js"></script>
  <!-- accordion library (optional, not used in demo) -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-collapse.js"></script>
  <!-- carousel slideshow library (optional, not used in demo) -->
 
  <!-- autocomplete library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-typeahead.js"></script>
  <!-- tour library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/bootstrap-tour.js"></script>
  <!-- library for cookie management -->
<script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.chosen.min.js"></script>
  <!-- checkbox, radio, and file input styler -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.uniform.min.js"></script>
  <!-- plugin for gallery image view -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.colorbox.min.js"></script>
  <!-- rich text editor library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.cleditor.min.js"></script>
  <!-- notification plugin -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.noty.js"></script>
  <!-- file manager library -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.elfinder.min.js"></script>
  <!-- star rating plugin -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.raty.min.js"></script>
  <!-- for iOS style toggle switch -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.iphone.toggle.js"></script>
  <!-- autogrowing textarea plugin -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.autogrow-textarea.js"></script>
  <!-- multiple file upload plugin -->
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.uploadify-3.1.min.js"></script>
  <!-- history.js for cross-browser state change on ajax -->
  <!-- calander plugin -->
  <script src='file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/fullcalendar.min.js'></script>
  <!-- data table plugin -->
  <script src='file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.dataTables.min.js'></script>
    <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.cookie.js"></script>
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/jquery.history.js"></script>
  <script src="file:///C|/Users/Admin/Desktop/Java/JavaTP_Web/UNR-WEB/WebContent/js/charisma.js"></script>
  
    <script>
    $(document).ready(function(){
        $('.calendario').datepicker({
           
    });
        $.datepicker.setDefaults($.datepicker.regional["es"]);
    });
    </script>
  <script>
  $(function($){
	    $.datepicker.regional['es'] = {
	        closeText: 'Cerrar',
	        prevText: '<Ant',
	        nextText: 'Sig>',
	        currentText: 'Hoy',
	        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
	        dayNames: ['Domingo', 'Lunes', 'Martes', 'Mi�rcoles', 'Jueves', 'Viernes', 'S�bado'],
	        dayNamesShort: ['Dom','Lun','Mar','Mi�','Juv','Vie','S�b'],
	        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S�'],
	        weekHeader: 'Sm',
	        dateFormat: 'dd/mm/yy',
	        firstDay: 1,
	        isRTL: false,
	        showMonthAfterYear: false,
	        yearSuffix: ''
	    };
	    $.datepicker.setDefaults($.datepicker.regional['es']);
	});  

</script>


<script>
	$(document).ready( function() {
  $('#tabla').dataTable( {
	  "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
		"sPaginationType": "bootstrap",
	  "aLengthMenu": [1,2,5,10],
	    "oLanguage": {
    
      "sSearch":"Buscar:",
      "sInfo":"Mostrando _START_ a _END_ de _TOTAL_ entradas",
      "sZeroRecords":"No se encontraron registros",
      "sInfoFiltered":"(filtrado de _MAX_ entradas)",
      "sInfoEmpty":"Mostrando 0 de 0 entradas",
      "sLengthMenu":     "campos a mostrar por pagina _MENU_",
    	  "oPaginate": {
          "sNext":     "Siguiente",
          "sPrevious": "Anterior"
      }
    }
  } );
} );
</script>

<script type="text/javascript">
function validar()
        {
			var fallo = false;
   			var falta = "";
			var elementos = document.getElementsByName("nota");
			if (datos.datepicker.value == "") {
                falta += "Falta ingresar la fecha \n";
                fallo = true;
            }
			var bandera=false;
			for(var i=0; i<elementos.length; i++) {
			
			if(elementos[i].value!="")
				{
				bandera=true;
				break;
				}
			
			}
			if(!bandera)
				{
				falta += "Debe ingresar la nota para al menos un alumno\n";
				fallo = true;
				
				}
			else{
				var formato = /^\d+.?\d*$/;
				for(var i=0; i<elementos.length; i++) {
					if(elementos[i].value!="")
					{
					var nota = formato.test(elementos[i].value);
					if(!nota){
						falta += "La nota debe ser un numero\n";
						fallo = true;
						break;
							}
		  		
					}
				}
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
 <%} %> 
</body>
</html>