package dao;

import entidad.Reserva;
import java.util.ArrayList;

public interface ReservaDao {

	public ArrayList <Reserva> listar();
	public boolean insert(Reserva reserva);
	public boolean darBaja(Reserva reserva);
}
