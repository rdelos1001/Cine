<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelo.Administrador"%>
<%@page import="servlet.mainServlet"%>
	
	
<%
	if(mainServlet.adminLogeado()==false){
		System.out.print("prueba");
		response.sendRedirect("http://localhost:8080/ConsultaDirectoresCine/loginAdmin.jsp");

	}
	String usuario= mainServlet.getAdminName();
	String pass="";
	for(int i=0;i<mainServlet.getAdminPass().length();i++){
		pass=pass+"*";
	}
%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<title>Inicio</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
	
	<!-- Personal CSS -->
  	<link rel="stylesheet" href="style/main.css">
 	<link rel="icon" type="image/ico" href="img/favicon.ico">
 	
 	<!-- Personal JS -->
	<script type="text/javascript">
		function changePage(url){
			 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
		}	
	</script>
	
</head>
<body>
 	<div class="container">
		<div class="row">
			<div class=col-6>
				
				<button onclick="changePage('index.jsp')" class="btn btn-warning">Volver</button>
				<form method="get" action="mainServlet">
					<input type="hidden" name="funcion" value=2>
					<button type="submit" title="Inicia una nueva sesión" class="btn btn-success">CerrarSesion</button>
				</form>
				
			</div>
			<div class="col-6 text-right">
				
				<label>Usuario: <%=usuario %></label><br>
				<label>Password: <%=pass %></label>
			</div>
		</div>
		<h1>Inicio</h1>
	<form method="post" action="mainServlet">
		<input type="hidden" name="action" value="5" ></input>
		<input type="submit" class="btn btn-success" value="Mantenimiento de peliculas"></input>
	</form>				
	</div>
	<!-- Bootstrap -->
	<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
	<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>

</body>
</html>