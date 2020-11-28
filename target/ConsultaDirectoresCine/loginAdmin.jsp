<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
 		<link rel="stylesheet" href="style/main.css">
 		<link rel="stylesheet" href="style/loginAdmin.css">
 		
 		<link rel="icon" type="image/ico" href="img/favicon.ico">
 			<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
		
	</head>
	<body>
			<button onclick="changePage('index.jsp')" class="btn btn-warning">Volver</button>
		<h1>Login Administradores</h1>
		<form method="post" action="mainServlet">
			<input type="hidden" name="action" value="3"></input>
			<label >Usuario:</label><br>
			<input type="text" name="nombreUsuario" autofocus></input><br>
			<label>Contraseña:</label><br>
			<input type="password" name="usuario"></input><br>
			<input type="submit" value="Entrar"></input>
		</form>
		
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	</body>
</html>