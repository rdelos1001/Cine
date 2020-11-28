package modelo;
/**
 * Clase Pelicula con su titulo, edad recomendada, fecha de estreno y el nombre del director*/
public class Pelicula {
	
	/**Titulo de la pelicula*/
	private String titulo;
	
	/**Edad recomendada de la pelicula*/
	private int edadMinima;
	
	/**Fecha de estreno de la pelicula*/
	private String fechaEstreno;
	
	/**Nombre del director de la pelicula*/
	private String nombreDirector;
	
	
	/**
	 * Construcctor de pelicula sin datos*/
	public Pelicula() {
		this.titulo = "";
		this.edadMinima = 0;
		this.fechaEstreno = "";
		this.nombreDirector = "";
	}
	
	/**Constructor de la pelicula con todos sus datos*/
	public Pelicula(String titulo, int edadMinima, String fechaEstreno, String nombreDirector) {
		this.titulo = titulo;
		this.edadMinima = edadMinima;
		this.fechaEstreno = fechaEstreno;
		this.nombreDirector = nombreDirector;

	}
	
	/**Contructor de Pelicula sin su Director*/
	public Pelicula(String titulo, int edadMinima, String fechaEstreno) {
		this.titulo = titulo;
		this.edadMinima = edadMinima;
		this.fechaEstreno = fechaEstreno;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getEdadMinima() {
		return edadMinima;
	}
	public void setEdadMinima(int edadMinima) {
		this.edadMinima = edadMinima;
	}
	public String getFechaEstreno() {
		return fechaEstreno;
	}
	public void setFechaEstreno(String fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}
	public String getNombreDirector() {
		return nombreDirector;
	}
	public void setNombreDirector(String nombreDirector) {
		this.nombreDirector = nombreDirector;
	}
}
