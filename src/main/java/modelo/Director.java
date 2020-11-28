package modelo;

/**Clase Director con su nombre */
public class Director {
	private String nombre;
	
	/**Constructor vacio de Director*/
	public Director() {
		this.nombre="";
	}
	
	/**Contructor de administrador con su nombre*/
	public Director(String nombre) {
		this.nombre=nombre;
	}
	
	/**Getter del nombre*/
	public String getNombre() {
		return nombre;
	}
	
	/**Setter del nombre*/
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}
