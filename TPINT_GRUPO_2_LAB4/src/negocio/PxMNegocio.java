package negocio;

import entidad.Profesores_x_Materias;
import java.util.ArrayList;

public interface PxMNegocio {
	
	public boolean insert(Profesores_x_Materias pxm);
	public ArrayList <Profesores_x_Materias> listar();
}
