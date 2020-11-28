<%@page import="modelo.Director"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="servlet.mainServlet" %>
 <%@ page import="modelo.Pelicula" %>
  <%@page import="java.util.List"%>
 

<%

	Pelicula pelicula= (Pelicula)request.getAttribute("peliculaModificar");
	List<Director> list= (List<Director>)request.getAttribute("directoresDisponibles");

%>    
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
		<link rel="stylesheet" href="style/mostrarPeliculas.css">
		
		<link rel="icon" type="image/ico" href="img/favicon.ico">
		<script type="text/javascript">
			function changePage(url){
				 window.location.href = 'http://localhost:8080/ConsultaDirectoresCine/'+url;
			}	
		</script>
	</head>
	<body>
	
		<button onclick="changePage('inicio.jsp')" class="btn btn-warning">Volver</button>	
		<div class="container">
			
		<h1>Modificar</h1>
			<h2>Pelicula</h2>
				<form method="post" action="mainServlet">
				<button type="submit" class="btn btn-primary">Modificar</button>
				<input type="hidden" name="peliculaOldTit" value="<%=pelicula.getTitulo()%>"/>
				<input type="hidden" name="peliculaOldEdad" value="<%=pelicula.getEdadMinima()%>"/>
				<input type="hidden" name="peliculaOldFecha" value="<%=pelicula.getFechaEstreno()%>"/>				
				<input type="hidden" name="peliculaOldDir" value="<%=pelicula.getNombreDirector()%>"/>				
				<input type="hidden" name="action" value="6"/>
			<table>
				<tr>
					<th>Titulo</th>
					<th>Edad recomendada</th>
					<th>Fecha de estreno</th>
					<th>Director</th>
				</tr>
				<tr>
					<td>
						<input type="text" maxlength="100" name="titulo" value="<%=pelicula.getTitulo() %>" required/>
					</td>			
					<td>
						<input size="5" type="number" maxlength="2" min="0" max="18" name="edad" value="<%=pelicula.getEdadMinima() %>" required/>
					</td>		
					<td>
						<input type="date" name="fechaEstreno" value="<%=pelicula.getFechaEstreno() %>" required/>
					</td>	
					<td>
						<select name="nombreDirector">
							<%for(Director director:list){
								if(director.getNombre().equals(pelicula.getNombreDirector())){
									%>
									<option selected="selected"><%= director.getNombre() %></option>									
									<%
																			
								}else{
								%>
									<option><%= director.getNombre() %></option>
								<%
								}
							} %>
						
						</select>
					</td>
				</tr>
			</table>			
		</form>
		</div>
		<!-- Bootstrap -->
		<script type="text/javascript" src="style/Bootstrap/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/popper.min.js"></script>
		<script type="text/javascript" src="style/Bootstrap/bootstrap.min.js"></script>
	
	</body>
</html>