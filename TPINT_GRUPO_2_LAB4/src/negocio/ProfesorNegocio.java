package negocio;

import java.util.ArrayList;

import entidad.Profesor;

public interface ProfesorNegocio {
	
	public boolean insert (Profesor profesor);
	public boolean delete (Profesor profesor);
	public boolean update (Profesor profesor);
	public ArrayList<Profesor> listar();
	public Profesor traerProfesor(String dni);
}
