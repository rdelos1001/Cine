package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class getData {
	/**
	 * Url del driver que se desea cargar
	 * */
	private static final String URLDRIVER="com.mysql.cj.jdbc.Driver";
	
	/**
	 * Url de la base de datos
	 * */
	private static final String URLDB="jdbc:mysql://localhost:3306/DirectoresCine";
	
	/**
	 * Nombre de usuario
	 * */
	private static final String USER="root";
	
	/**
	 * Contraseña
	 * */
	private static final String PASSWORD="";
	/**
	 * Obtiene los datos del director cuyo nombre es recibido
	 * @return devuelve los datos del director como tipo Director
	 * @param nombreDirector del director a buscar.
	 * */
	
	/**
	 * Busca una lista de peliculas según su director
	 * @param nombreDirector es el nombre del director por el que se desea buscar las peliculas
	 * @return Devuelve un arrayList con todas las peliculas del director recibido
	 * */
	public static ArrayList<Pelicula> buscarPelicula(String nombreDirector) {
		ArrayList<Pelicula> peliculas= new ArrayList<Pelicula>();
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement
					("SELECT Pelicula.Nombre,EdadMinima,FechaEstreno,Director.Nombre"
							+ " FROM `Pelicula`,`Director` "
							+ "WHERE idDirector=Director.id "
							+ "AND Director.Nombre LIKE '"+nombreDirector+"%'"
							+ "ORDER BY 1");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				peliculas.add(new Pelicula(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4)  ));
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return peliculas;
	}
	
	/**
	 * Busca todos los directores disponibles
	 * @return Devuelve un arraList con todos los directores de la BBDD
	 * */
	public static ArrayList<Director> directoresDisponibles(){
		ArrayList<Director> directoresDisponibles= new ArrayList<Director>();
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement
					("SELECT Nombre FROM `Director`");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				directoresDisponibles.add(new Director(rs.getString(1)));
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return directoresDisponibles;
	}
	
	/**
	 * Comprueba las credenciales de acceso para todas logear al usuario
	 * @param nombreUsuario es el nombre de usuario que se desea logear
	 * @param contraseña es la contraseña que el usuario ha introducido para logearse
	 * @return <ul>
	 * 				<li>True: se concede acceso</li>
	 * 				<li> False: no se concede acceso</li>
	 * 			</ul>*/
	public static boolean comprobarCredenciales(String nombreUsuario,String contraseña) {
		Connection conn=null;
		boolean check=false;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement
					("SELECT usuario,contraseña"
							+ " FROM `Administrador`,`Director` "
							+ "WHERE usuario = '"+nombreUsuario+"'"
							+ "AND contraseña='"+contraseña+"'");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				check=true;
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	/**
	 * Busca una pelicula según su posición por orden alfabetico
	 * @param posicion es la posición de la pelicula 
	 * @return devuelve la pelicula que de esa posición*/
	public static Pelicula buscarPelicula(int posicion) {
		Pelicula pelicula=null;
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		int cont=1;
		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement
					("SELECT Pelicula.nombre,edadMinima,FechaEstreno,Director.nombre FROM Pelicula, Director "
							+ "WHERE idDirector=Director.id Order by 1");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				if(cont==posicion) {
					pelicula=new Pelicula(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4));
				}
				cont++;
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return pelicula;
	}
	
	/**
	 * Elimina una serie de peliculas de la BBDD
	 * @param peliculas Recibe un arrayList con todas las peliculas de que desean borrar
	 * */
	public static void borrarPeliculas(ArrayList<Pelicula> peliculas) {
		Connection conn=null;
		Statement s=null;
		

		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			s=conn.createStatement();
			
			for(Pelicula pelicula:peliculas) {
				System.out.println("Borrando "+pelicula.getTitulo()+"...");
				s.executeUpdate("DELETE FROM `Pelicula` WHERE Nombre='"+pelicula.getTitulo()+"'"
						+ " AND EdadMinima='"+pelicula.getEdadMinima()+"' "
						+ " AND FechaEstreno='"+pelicula.getFechaEstreno()+"'");				
			}
		
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(s!=null)s.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Inserta una pelicula en la BBDD
	 * @param pelicula Es la pelicula que se desea insertar*/
	public static void insertarPelicula(Pelicula pelicula) {
		Connection conn=null;
		Statement s=null;
		int idDirector=0;
		ResultSet rs=null;
		PreparedStatement ps=null;

		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement("SELECT id FROM `Director` where nombre='"+pelicula.getNombreDirector()+"'");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				idDirector=rs.getInt(1);
			}
			s=conn.createStatement();
			
			if(idDirector!=0)
			s.executeUpdate("INSERT INTO `Pelicula`( `Nombre`, `EdadMinima`, `FechaEstreno`, `idDirector`)"
					+ " VALUES ('"+pelicula.getTitulo()+"','"+pelicula.getEdadMinima()+"','"+pelicula.getFechaEstreno()
					+"','"+idDirector+"')");
		
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(s!=null)s.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}


	/**
	 * Modifica una pelicula
	 * @param peliculaOld Son los datos antiguos de esa pelicula
	 * @param peliculaNew son los nuevos datos de la pelicula*/
	public static void modificarPelicula(Pelicula peliculaOld, Pelicula peliculaNew) {
		Connection conn=null;
		Statement s=null;
		int idDirectorNew=0;
		ResultSet rs=null;
		PreparedStatement ps=null;

		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			ps=conn.prepareStatement("SELECT id FROM `Director` where nombre='"+peliculaNew.getNombreDirector()+"'");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				idDirectorNew=rs.getInt(1);
			}
			s=conn.createStatement();
			
			if(idDirectorNew!=0)
				s.executeUpdate(""
						+ "UPDATE Pelicula SET nombre='"+peliculaNew.getTitulo()+"' , edadMinima='"+peliculaNew.getEdadMinima()+"' ,"
						+ " fechaEstreno='"+peliculaNew.getFechaEstreno()+"' , idDirector='"+idDirectorNew+"' "
						+ "where nombre='"+peliculaOld.getTitulo()+"' AND edadMinima='"+peliculaOld.getEdadMinima()+"' "
						+ "AND fechaEstreno='"+peliculaOld.getFechaEstreno()+"' ");

		
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(s!=null)s.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	/**
	 * Se añade un nuevo usuario admin a la BBDD
	 * @param usuario es el nombre de usuario del nuevo Administrador
	 * @param contraseña es la contraseña del nuevo Administrador*/
	public static void añadirAdmin(String usuario, String contraseña) {
		Connection conn=null;
		Statement s=null;

		try {
			Class.forName(URLDRIVER);
			conn=DriverManager.getConnection(URLDB,USER,PASSWORD);
			
			s=conn.createStatement();
			s.executeUpdate("INSERT INTO Administrador (usuario,contraseña) VALUES('"+usuario+"', '"+contraseña+"')");
		
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(s!=null)s.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
