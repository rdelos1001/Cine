package tools;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * Esta clase comprueba si los datos recibidos son correctos
 * @author Raúl
 *
 */
public class Validaciones {

	
	/**
	 * Este método comprueba la validez del nombre recibido
	 * @param nombre
	 * @return <ul>
	 * 				<li>True: El nombre es correcto</li>
	 * 				<li>False: El nombre es incorrecto</li>
	 * 		   </ul>
	 */
	public static boolean validarNombre(String nombre) {
		boolean check=false;
		String patron="^[a-zA-Z]*$";
		Pattern p = Pattern.compile(patron);
		Matcher m = p.matcher(nombre);
		check=m.matches();
		return check;
	}
}
