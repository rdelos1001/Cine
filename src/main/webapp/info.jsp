<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Información</title>
		<meta lang="es"></meta>
		<meta charset="UTF-8"></meta>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
		<link rel="stylesheet" href="style/main.css">
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
	</head>
	<body>
	
		<button onclick="changePage('index.jsp')" class="btn btn-warning">Volver</button>		
		<h1>Información</h1>
		<p>Esta es una página estandar de información</p>
	
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	
	</body>
</html>