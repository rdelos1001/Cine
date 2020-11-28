package modelo;

/**Clase administrador con su nombre de usuario y su contraseña */
public class Administrador {
	private String usuario;
	private String contraseña;
	
	/**Constructor vacio de Administrador*/
	public Administrador() {
		usuario="";
		contraseña="";
	}

	/**Contructor de administrador con todos sus datos*/
	public Administrador(String usuario, String contraseña) {
		this.usuario = usuario;
		this.contraseña = contraseña;
	}
	
	/**Getter del nombre de usuario*/
	public String getUsuario() {
		return usuario;
	}
	
	/**Setter del nombre de usuario*/
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	/**Getter de la contraseña*/
	public String getContraseña() {
		return contraseña;
	}

	/**Setter de la contraseña*/
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}


	
}
