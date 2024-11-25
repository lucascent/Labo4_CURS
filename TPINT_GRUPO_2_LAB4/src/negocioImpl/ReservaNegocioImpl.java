package negocioImpl;

import java.util.ArrayList;

import entidad.Reserva;
import negocio.ReservaNegocio;
import daoImpl.ReservaDaoImpl;

public class ReservaNegocioImpl implements ReservaNegocio {
	
	ReservaDaoImpl dao = new ReservaDaoImpl();
	
	public ArrayList<Reserva> listar() {
		
		return dao.listar();
	}

	@Override
	public boolean insert(Reserva reserva) {
		
		boolean estado = false;
		
		if(reserva.getProfesor().getDni().trim().length() > 0 && reserva.getMateria().getId() > 0 && reserva.getAdministrador().getDni().trim().length() > 0
				&& reserva.getAula().getId() > 0 )  {
			estado = dao.insert(reserva);
		}
				
		return estado;
	}

	@Override
	public boolean darBaja(Reserva reserva) {
		boolean estado = false;
		
		if(reserva.getId() > 0) {
			estado = dao.darBaja(reserva);
		}
		
		return estado;
	}

}
