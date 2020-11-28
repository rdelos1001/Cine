<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List"%>
<%@page import="modelo.Director"%>
<%
List<Director> list= (List<Director>)request.getAttribute("directoresDisponibles");

%>
<!DOCTYPE html>
<html>
	<head>
		<title>Añadir pelicula</title>
		<meta lang="es"></meta>
		<meta charset="UTF-8"></meta>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="style/Bootstrap/bootstrap.min.css">
		
		<!-- Personal CSS -->
		<link rel="stylesheet" href="style/main.css">
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		<link rel="stylesheet" href="style/mostrarPeliculas.css">

		<!-- Personal js -->
		<script type="text/javascript" src="/js/insertarPelicula.js"></script>
		<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
	</head>
	<body>
		<button onclick="changePage('inicio.jsp')" class="btn btn-warning">Volver</button>		
		<div class="container">
			<div class="row">
				<div class="col-11">
					<h1>Añadir pelicula</h1>				
				</div>
			</div>
		</div>
																			
		<form method="get" action="mainServlet">
			<button type="submit" class="btn btn-success">Añadir</button>
			<input type="hidden" name="funcion" value="3"/>
			<table>
				<tr>
					<th>Titulo</th>
					<th>Edad recomendada</th>
					<th>Fecha de estreno</th>
					<th>Director</th>
				</tr>
				<tr>
					<td>
						<input type="text" maxlength="100" name="titulo" required/>
					</td>			
					<td>
						<input size="5" type="number" maxlength="2" min="0" max="18" name="edad" required/>
					</td>		
					<td>
						<input type="date" name="fechaEstreno" required/>
					</td>	
					<td>
						<select name="nombreDirector">
							<%for(Director director:list){
								%>
								<option><%= director.getNombre() %></option>
								<%
							} %>
						
						</select>
					</td>
				</tr>
			</table>			
		</form>
	
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	</body>
</html>