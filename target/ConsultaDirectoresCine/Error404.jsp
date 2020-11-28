<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Error404</title>
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
		<h1>Error 404 NOT FOUND</h1>
		<img alt="404Error" width="35%" title="Error404.png" src="img/404.png">
				<button onclick="changePage('index.jsp')" class="btn btn-warning">Volver</button>
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
		
	</body>
	<style>
	body{
		text-align:center;
	}
	</style>
</html>