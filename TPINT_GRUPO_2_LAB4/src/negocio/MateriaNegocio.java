package negocio;

import java.util.ArrayList;

import entidad.Materia;

public interface MateriaNegocio {
	public ArrayList <Materia> listar ();
	public int insert (Materia materia);
	public Materia traerMateria(int id);
	public boolean update (Materia materia);
	public boolean delete (Materia materia);
}
