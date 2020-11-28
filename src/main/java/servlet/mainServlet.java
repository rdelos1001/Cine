package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Administrador;
import modelo.Director;
import modelo.Pelicula;
import modelo.getData;
import tools.DatosNoCorrectosException;
import tools.Validaciones;

/**
 * Servlet implementation class mainServlet
 */
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Director>directoresBuscados=new ArrayList<Director>();
	private static Administrador adminLogeado=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * Metodo do Get del Servlet
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @param funcion indica que funcion va a realizar el método
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int funcion=0;
		String path="";
		
		if(request.getParameter("funcion")!=null) {
			funcion= Integer.parseInt(request.getParameter("funcion"));
		}
		
		if(request.getParameter("ruta")!="") {
			path= request.getParameter("ruta");
		}
		
		switch(funcion) {
		
		//Resetea los directores buscados
		case 1:
			nuevaSesion();
			path="index.jsp";
			break;
		
		//Cierra la sesión del usuario
		case 2:
			cerrarSesion();
			path="index.jsp";
			break;
		
		//Función añadir de mantenimiento.jsp
		case 3:
			String titulo=request.getParameter("titulo");
			int edad=Integer.parseInt(request.getParameter("edad"));
			String fechaEstreno=request.getParameter("fechaEstreno");
			String nombreDirector=request.getParameter("nombreDirector");
			
			getData.insertarPelicula(new Pelicula(titulo,edad,fechaEstreno,nombreDirector));
			path="inicio.jsp";
			break;
			
		//Muestra todas las peliculas
		case 4:
			ArrayList<Pelicula> peliculas =getData.buscarPelicula("");
			request.setAttribute("peliculas", peliculas);
			if(path==null) {
				path="mantenimiento.jsp";
			}
			break;
			
		//Muestra en la página insertarPeliculas.jsp todos los directores posibles
		case 5:
			ArrayList<Director> directoresDisponibles =getData.directoresDisponibles();
			request.setAttribute("directoresDisponibles", directoresDisponibles);
			path="insertarPelicula.jsp";
			break;
		
			//Modificar pelicula
		case 6:
			int pos = 0;
			Pelicula peliculaModificar=null;
			
			pos=Integer.parseInt(request.getParameter("pos"));
			
			peliculaModificar=getData.buscarPelicula(pos);
			request.setAttribute("peliculaModificar", peliculaModificar);
			request.setAttribute("directoresDisponibles", getData.directoresDisponibles());

			path="modificar.jsp";
			break;
			
		default:
			path="Error404.jsp";
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * Método do Post del servlet
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * @param action indica la función que va a realizar el método
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int action =0;
		String path="";
		
		
		if(request.getParameter("action")!=null) {
			action= Integer.parseInt(request.getParameter("action"));
		}
		switch(action) {
		
				
		/*Recoge el nombre y apellido del director desde el formulario los valida y
		 *  redirecciona hacia la página mostrarPeliculas.jsp*/
		case 1:
			String nombreDirector="";
			if(request.getParameter("nombreDirector")!=null) {
				nombreDirector=request.getParameter("nombreDirector");
			}
			try {
				if(Validaciones.validarNombre(nombreDirector)) {
					ArrayList<Pelicula> peliculas =getData.buscarPelicula(nombreDirector);
					request.setAttribute("peliculas", peliculas);
					
					for(Pelicula pelicula:peliculas) {
						if(!existeDirector(pelicula.getNombreDirector())) {					
							directoresBuscados.add(new Director(pelicula.getNombreDirector()));
						}
					}
					path="mostrarPeliculas.jsp";
				}else {
					throw new DatosNoCorrectosException();
				}
			}catch(DatosNoCorrectosException e) {
				e.printStackTrace();
				imprimirPantallaError(response);
			}

			break;
		/*Redirecciona hacia la página mostrarDirectores para mostrar los directores buscados*/
		case 2:
			request.setAttribute("directoresBuscados", directoresBuscados);
			path="mostrarDirectores.jsp";
			break;
			
			
		//Comprueba los datos de login y redirecciona hacia la página de inicio de los administradores
		case 3:
			String nombreUsuario="";
			String contraseña="";
			
			nombreUsuario=request.getParameter("nombreUsuario");
			contraseña=request.getParameter("usuario");
			
			if(getData.comprobarCredenciales(nombreUsuario, contraseña)) {
				adminLogeado= new Administrador(nombreUsuario,contraseña);
				path="inicio.jsp";
			}else {
				path="loginAdmin.jsp";
			}
			break;
			
			/*Redirecciona a inicio.jsp si el usuario ya está logeado y a loginAdmin.jsp si no lo está*/
		case 4:
			if(adminLogeado()) {
				path="inicio.jsp";
			}else {
				path="loginAdmin.jsp";
			}
			break;
			
		//Eliminar pelicula
		case 5:
			ArrayList<Integer> posiciones = new ArrayList<Integer>();
			int size = getData.buscarPelicula("").size();
			ArrayList<Pelicula> peliculaBorrar= new ArrayList<Pelicula>();
			
			
			for(int i=1;i<=size;i++) {
				if(request.getParameter("film"+i)!=null) {
					posiciones.add(Integer.parseInt(request.getParameter("film"+i)));
				}
			}
			
			
			for(int i=0;i<posiciones.size();i++) {
				peliculaBorrar.add(getData.buscarPelicula(posiciones.get(i)));
			}
			getData.borrarPeliculas(peliculaBorrar);
			path="inicio.jsp";
			break;
		
		//Modificar peliculas
		case 6:
			String titulo=request.getParameter("titulo");
			int edad=Integer.parseInt(request.getParameter("edad"));
			String fechaEstreno=request.getParameter("fechaEstreno");
			nombreDirector=request.getParameter("nombreDirector");

			Pelicula peliculaOld = new Pelicula(
					request.getParameter("peliculaOldTit"),
					Integer.parseInt(request.getParameter("peliculaOldEdad")),
					request.getParameter("peliculaOldFecha"),
					request.getParameter("peliculaOldDir")					
					);
			Pelicula peliculaNew = new Pelicula(titulo,edad,fechaEstreno,nombreDirector);
			getData.modificarPelicula(peliculaOld,peliculaNew);
			path="inicio.jsp";
			break;
			
		//Añadir nuevo admin
		case 7:
			String usuario= request.getParameter("usuario");
			String pass= request.getParameter("usuarioPass");
			getData.añadirAdmin(usuario,pass);
			break;
		default:
			path="Error404.jsp";
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	/**
	 * Imprime una pantalla de error cuando los datos están mal introducidos*/	
	private void imprimirPantallaError(HttpServletResponse res) {
		try {
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println(""
					+ "<HTML><HEAD><TITLE>Error</TITLE></HEAD>"
					+ "<BODY><h1 style=\"color:red\">Los datos introducidos no son correctos</h1>"
					+ "		<form method=\"get\" action=\"index.jsp\">\n"
					+ "			<button "
					+ "					style=\""
					+ "						background-color: #4CAF50;"
					+ "  					border: none;"
					+ "						padding: 15px 32px;"
					+ "  					color: white;\""
					+ "					type=\"submit\">Volver al menú principal</button>"
					+ "		</form>"
					+ "</BODY></HTML>");
			out.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**Busca a un director
	 * @param nombre nombre del director
	 * @return <ul>
	 * 				<li>True: el director existe</li>
	 * 				<li>False: el director no existe</li>	
	 * 			</ul>*/
	private boolean existeDirector(String nombre) {
		boolean check=false;
		for(Director director: this.directoresBuscados) {
			if(director.getNombre().equals(nombre)) {
				check=true;
			}
		}
		return check;
	}
	private void nuevaSesion() {
		this.directoresBuscados.clear();
	}
	
	/**Método que cierra sesion*/
	private static void cerrarSesion() {
		mainServlet.adminLogeado=null;
	}

	/**Comprueba si el usuario está o no logeado*/
	public static boolean adminLogeado() {
		boolean check=false;
		if(adminLogeado!=null) {
			check=true;
		}
		return check;
	}
	
	/**Obtiene el nombre del usuario logeado*/
	public static String getAdminName() {
		return adminLogeado.getUsuario();
	}
	
	/**Obtiene la contraseña del usuario logeado*/
	public static String getAdminPass() {
		return adminLogeado.getContraseña();
	}
}
