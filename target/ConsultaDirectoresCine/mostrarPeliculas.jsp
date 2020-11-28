<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Pelicula" %>

<%

List<Pelicula> list= (List<Pelicula>)request.getAttribute("peliculas");
String titulo=request.getAttribute("titulo")+""; 
String busquedaNombre=request.getParameter("nombreDirector")+""; 
String busquedaApellido=request.getParameter("apellidoDirector")+""; 

%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Resultado de la busqueda</title>
		<meta charset="UTF-8">

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
		function consultarDirectores(){
			var visiblility = document.getElementById('busqueda').style.visibility;
			if(visiblility=="hidden"){
				document.getElementById('busqueda').style.visibility="";
				document.getElementById('btnConsulta').textContent="Ocultar Nueva Consulta"
		    }else{
		    	document.getElementById('busqueda').style.visibility="hidden";
				document.getElementById('btnConsulta').textContent="Nueva Consulta"
		    }
		}
		</script>
 	</head>
	<body>
	<div class="container">
		<div class="row">	
			<button onclick="changePage('index.jsp')" class="btn btn-warning">Volver</button>
			<button id="btnConsulta" onclick="consultarDirectores()" class="btn btn-dark">Nueva consulta</button>			
		</div>
		<div class="row">
			<div id="resultadoBusqueda" class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<h2>Resultado de la busqueda</h2>		
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
							<td><%=pelicula.getNombreDirector() %> <%=pelicula.getApellidoDirector() %></td>	
						</tr>	
				<%}%>
					</table>
	
			<%}else{%> 
				<label>No hay peliculas de ese director</label>	
			<%}%>
			<form method="post" action="mainServlet">
				<input type="hidden" name="action" value="2"></input>			
				<button type="submit" class="btn btn-success">Finalizar</button>
			</form>
			</div>
				
			<div id="busqueda" style="visibility:hidden" class=" col-ĺg-4 col-md-4 col-sm-12 col-xs-12">
				<h1>Datos del Director</h1>	
				<form method="post" action="mainServlet" >
					<input type="hidden" name="action" value="1" ></input>
					<label>Nombre:</label>
					<input type="text" value="<%=busquedaNombre %>" name="nombreDirector"></input><br>
					<label>Apellidos:</label>
					<input type="text" value="<%=busquedaApellido %>" name="apellidoDirector"></input>
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