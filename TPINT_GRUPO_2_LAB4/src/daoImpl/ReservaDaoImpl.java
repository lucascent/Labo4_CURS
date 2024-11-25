package daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ReservaDao;
import java.sql.CallableStatement;
import java.sql.Connection;

import daoImpl.Conexion;

import entidad.*;


import java.util.Date;

import org.apache.tomcat.jni.Time;


public class ReservaDaoImpl implements ReservaDao{
	
	private static final String listar =  "SELECT Id_Reserva ,Id_Materia, Id_Aula, Dni_Profesor, Dni_Administrador, Fecha, Hora_Inicio, Hora_Final, Estado FROM reservas_aulas WHERE Estado = 1"; 
	private static final String darBaja = "UPDATE reservas_aulas SET Estado = 0 WHERE Id_Reserva = ?"; 
	

	@Override
	public ArrayList<Reserva> listar() {
		
		PreparedStatement statement;
		ResultSet resultSet; 
		ArrayList<Reserva> reservas = new ArrayList<Reserva>();
		Conexion conexion = Conexion.getConexion();
		try 
		{
			statement = conexion.getSQLConexion().prepareStatement(listar);
			resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				reservas.add(getReserva(resultSet));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return reservas;
	}
	
	
	private Reserva getReserva(ResultSet resultSet) throws SQLException
	{
		int id = resultSet.getInt("Id_Reserva");
		int idMateria = resultSet.getInt("Id_Materia");
		int idAula = resultSet.getInt("Id_Aula");
		String dniProfesor = resultSet.getString("Dni_Profesor");
		String dniAdministrador = resultSet.getString("Dni_Administrador");
		Date fecha = resultSet.getDate("Fecha");
		java.sql.Time horaInicio = resultSet.getTime("Hora_Inicio");
		java.sql.Time horaFinal = resultSet.getTime("Hora_Final");
		boolean estado = resultSet.getBoolean("Estado");
		
		Materia materia = new Materia();
		materia.setId(idMateria);		
		
		Aula aula = new Aula();
		aula.setId(idAula);
		
		Profesor profesor = new Profesor();
		profesor.setDni(dniProfesor);
		
		Administrador admin = new Administrador();
		admin.setDni(dniAdministrador);
		
		return new Reserva(id,aula,admin,profesor,materia,fecha,horaInicio,horaFinal,estado);
	}


	@Override
	public boolean insert(Reserva reserva) {
		 boolean resultado = false;
		    String procedimiento = "{CALL sp_cargareserva(?, ?, ?, ?, ?, ?, ?)}"; 
		    Connection conexion = Conexion.getConexion().getSQLConexion();

		    try (CallableStatement cst = conexion.prepareCall(procedimiento)) {
		        // Configurar parámetros del procedimiento almacenado
		        cst.setInt(1, reserva.getAula().getId());
		        cst.setString(2, reserva.getAdministrador().getDni());
		        cst.setString(3, reserva.getProfesor().getDni());
		        cst.setInt(4, reserva.getMateria().getId());
		        cst.setDate(5, new java.sql.Date(reserva.getFecha().getTime()));
		        cst.setTime(6, reserva.getHoraInicio());
		        cst.setTime(7, reserva.getHoraFinal());
		       

		        // Ejecutar procedimiento almacenado
		        resultado = cst.executeUpdate() > 0;
		        conexion.commit();
		    } catch (SQLException e) {
		        e.printStackTrace();
		        try {
		            conexion.rollback();
		        } catch (SQLException rollbackEx) {
		            rollbackEx.printStackTrace();
		        }
		    }
		    return resultado;
	}


	@Override
	public boolean darBaja(Reserva reserva) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean bajaExitosa = false;
		try 
		{
			statement = conexion.prepareStatement(darBaja);
			statement.setInt(1, reserva.getId());
			if(statement.executeUpdate() > 0)
			{
				conexion.commit();
				bajaExitosa = true;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return bajaExitosa;
	}
	


}
