<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List"%>
 <%@ page import="servlet.mainServlet" %>
 <%@ page import="modelo.Pelicula" %>

<%

List<Pelicula> list= (List<Pelicula>)request.getAttribute("peliculas");

%>    
    
<!DOCTYPE html>
<html>
	<head>
		<title>Eliminar</title>
		<meta lang="es"></meta>
		<meta charset="UTF-8"></meta>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
		<link rel="stylesheet" href="style/main.css">
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		<link rel="stylesheet" href="style/mostrarPeliculas.css">
		
		<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
	</head>
	<body>
	
		<button onclick="changePage('inicio.jsp')" class="btn btn-warning">Volver</button>		

		<div class="container">
		<h1>Eliminar</h1>
			<div class="row">
				<div class="col-7">
					<h2>Peliculas</h2>
				</div>				
			</div>
			<div class="row">
	
			<% if(list.size()>0){%>
				<form method="post" action="mainServlet"
					style="width: 100%;">
					<input type="hidden" name="action" value="5" />
					<button type="submit" class="btn btn-danger">Eliminar</button>
					<table>
						<tr>
							<th></th>
							<th>Titulo</th>
							<th>Edad recomendada</th>
							<th>Fecha de estreno</th>
							<th>Director</th>
						</tr>
				<%
					for(int i=0;i<list.size();i++){
				%>
						<tr>
							<td><input type="checkbox" name="film<%=i+1 %>" value="<%=i+1 %>"  /></td>
							<td><%=list.get(i).getTitulo() %></td>
							<td><%=list.get(i).getEdadMinima() %> años</td>
							<td><%=list.get(i).getFechaEstreno() %></td>		
							<td><%=list.get(i).getNombreDirector() %></td>	
						</tr>	
				<%}%>
					</table>
				
				</form>
	
			<%}else{%> 
				<label>No hay peliculas </label>	
			<%}%>
			</div>
		</div>
					

	
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	
	</body>
</html>