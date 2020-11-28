<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Director" %>
<%List<Director> list= (List<Director>)request.getAttribute("directoresBuscados");
 %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Directores buscados</title>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
		<link rel="stylesheet" href="style/main.css">
		<link rel="stylesheet" href="style/mostrarDirectores.css">
		<link rel="icon" type="image/ico" href="img/favicon.ico">

	</head>
	<body>
		<form method="get" action="mainServlet">
			<input type="hidden" name="funcion" value=1>
			<button type="submit" title="Inicia una nueva sesión" class="btn btn-warning">Volver</button>
		</form>
		<h1>Directores buscados</h1>
			<% if(list.size()>0){%>
				<ul>
				<%
					for(Director director : list){
				%>
						
						<li><%=director.getNombre() %> <%=director.getApellido() %></li>	
							
				<%}%>
					</ul>	
			<%}else{%> 
				<label>No has buscado a ningún director</label>	
			<%}%>
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	</body>
</html>