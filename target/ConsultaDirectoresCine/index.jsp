<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Consulta directores de cine</title>
		<meta lang="es"></meta>
		<meta charset="UTF-8"></meta>
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
 		<link rel="stylesheet" href="style/main.css">
 		<link rel="stylesheet" href="style/index.css"> 	
		<!-- Personal JS -->
	<script type="text/javascript">
		function changePage(page){
			 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+page;
		}	
		
		function consultarDirectores(){
			var visiblility = document.getElementById('buscarDirector').style.visibility;
			if(visiblility=="hidden"){
				document.getElementById('buscarDirector').style.visibility="";
				document.getElementById('btnConsulta').textContent="Ocultar Nueva Consulta"

		    }else{
		    	document.getElementById('buscarDirector').style.visibility="hidden";
				document.getElementById('btnConsulta').textContent="Nueva Consulta"

		    }
		}
		</script>
	</head>
	
	<body>
		
		<h1 class="text-center">Consulta de directores de cine</h1>
		<div class="container">
			<div class="row">
				<div class="mt-5 col-lg-2 col-md-2 col-sm-12 col-xs-12">
					<button onclick="changePage('info.jsp')" class="btn btn-outline-info">Información</button>
					<button id="btnConsulta" type="submit" onclick="consultarDirectores()" class="btn btn-danger">Consultar directores</button><br>		
					
					<form method="post" action="mainServlet">
						<input type="hidden" name="action" value="4"></input>
						<button class="btn btn-primary">Login</button>
					</form>
				
				</div>
				<div class="mt-5 col-lg-10 col-md-10 col-sm-12 col-xs-12" id="buscarDirector" style="visibility:hidden" >
					<h1 class="mb-5">Datos del Director</h1>	
					<form method="post" action="mainServlet">
						<input type="hidden" name="action" value="1" ></input>
						<label>Nombre del Director:</label>
						<input type="text" name="nombreDirector"></input><br>
						
						<label>Apellido del Director:</label>			
						<input type="text" name="apellidoDirector"></input><br>
						<input type="submit" class="btn btn-success" value="Consultar"></input>
					</form>				
				</div>
			</div>
		</div>

		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	</body>
</html>
