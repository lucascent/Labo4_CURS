package entidad;
import java.util.Date;

import org.apache.tomcat.jni.Time;

//import java.time.*;

public class Reserva {

	private int id;
	private Aula aula;
	private Administrador administrador;
	private Profesor profesor;
	private Materia materia;
	private Date fecha;
	java.sql.Time horaInicio;
	java.sql.Time horaFinal;
	private boolean estado = true;
	
	
	public Reserva() {}
	
	
	public Reserva(int id, Aula aula, Administrador administrador, Profesor profesor, Materia materia, Date fecha,
			java.sql.Time horaInicio, java.sql.Time horaFinal,boolean estado) {
		super();
		this.id = id;
		this.aula = aula;
		this.administrador = administrador;
		this.profesor = profesor;
		this.materia = materia;
		this.fecha = fecha;
		this.horaInicio = horaInicio;
		this.horaFinal = horaFinal;
		this.estado = estado;
	}
	
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Aula getAula() {
		return aula;
	}
	public void setAula(Aula aula) {
		this.aula = aula;
	}
	public Administrador getAdministrador() {
		return administrador;
	}
	public void setAdministrador(Administrador administrador) {
		this.administrador = administrador;
	}
	public Profesor getProfesor() {
		return profesor;
	}
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
	public Materia getMateria() {
		return materia;
	}
	public void setMateria(Materia materia) {
		this.materia = materia;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public java.sql.Time getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(java.sql.Time horaInicio) {
		this.horaInicio = horaInicio;
	}
	public java.sql.Time getHoraFinal() {
		return horaFinal;
	}
	public void setHoraFinal(java.sql.Time horaFinal) {
		this.horaFinal = horaFinal;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
	
	
}
