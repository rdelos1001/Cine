<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List"%>
 <%@ page import="servlet.mainServlet" %>
 <%@ page import="modelo.Pelicula" %>

<%
	if(!mainServlet.adminLogeado()){
		response.sendRedirect("http://localhost:8080/ConsultaDirectoresCine/loginAdmin.jsp");
	}

List<Pelicula> list= (List<Pelicula>)request.getAttribute("peliculas");

%>

<!DOCTYPE html>
<html>
	<head>
		<title>Mantenimiento de peliculas</title>
		<meta lang="es"></meta>
		<meta charset="UTF-8"></meta>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
		<link rel="stylesheet" href="style/main.css">
		<link rel="stylesheet" href="style/mostrarPeliculas.css">
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		
		<!-- Personal JS -->
		<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
	</head>
	<body>
		<button onclick="changePage('inicio.jsp')" class="btn btn-warning">Volver</button>		
		<div class="container">
			<h1>Mantenimiento</h1><br>
			<div class="row">
				<div class="col-7">
					<h2>Peliculas</h2>
				</div>
					<button onclick="changePage('insertarPelicula.jsp')" class="btn btn-success">Añadir</button>

					<button onclick="" class="btn btn-primary">Modificar</button>
					<form method="get" action="mainServlet">
						<input type="hidden" name="funcion" value="5"/>
						<button class="btn btn-danger">Eliminar</button>
					</form>
				
			</div>
			<div class="row">
	
				<% if(list.size()>0){%>
					<table>
						<tr>
							<th>Titulo</th>
							<th>Edad recomendada</th>
							<th>Fecha de estreno</th>
							<th>Director</th>
						</tr>
				<%
					for(Pelicula pelicula : list){
				%>
						<tr>
							<td><%=pelicula.getTitulo() %></td>
							<td><%=pelicula.getEdadMinima() %> años</td>
							<td><%=pelicula.getFechaEstreno() %></td>		
							<td><%=pelicula.getNombreDirector() %></td>	
						</tr>	
				<%}%>
					</table>
	
			<%}else{%> 
				<label>No hay peliculas de ese director</label>	
			<%}%>
			</div>
		</div>
					
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	</body>
</html>