package presentacion.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocioImpl.*;
import entidad.*;
import java.util.ArrayList;
import java.util.Date;


@WebServlet("/ServletReservas")
public class ServletReservas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ReservaNegocioImpl neg = new ReservaNegocioImpl();
	ProfesorNegocioImpl profesorNeg = new ProfesorNegocioImpl(); 
    MateriaNegocioImpl materiaNeg = new MateriaNegocioImpl(); 
    AulaNegocioImpl aulaNeg = new AulaNegocioImpl();
    CarreraNegocioImpl negCarrera = new CarreraNegocioImpl();
    PxMNegocioImpl negPxM = new PxMNegocioImpl();
	
	
    public ServletReservas() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// LISTAR
		
		if("list".equals(request.getParameter("Param")))			
		{
			 ArrayList<Reserva> listaReservas = neg.listar();
				
			
			 for (Reserva reserva : listaReservas) {
				 Profesor profesor = profesorNeg.traerProfesor(reserva.getProfesor().getDni()); 
	             Materia materia = materiaNeg.traerMateria(reserva.getMateria().getId()); 
	             Aula aula = aulaNeg.traerAula(reserva.getAula().getId()); 
	                               
	             reserva.setProfesor(profesor);
	             reserva.setMateria(materia);
	             reserva.setAula(aula);
	         }
			
			 request.setAttribute("listaReservas", listaReservas);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarReservas.jsp");
			 dispatcher.forward(request, response);
		}
		
		
		//DATOS PARA VISTA CREAR RESERVA
		
		
		if("datos".equals(request.getParameter("Param")))
		{
			//request.setAttribute("listaAulas",aulaNeg.listar());
			request.setAttribute("listaMaterias", materiaNeg.listar());
			request.setAttribute("listaProfesores", profesorNeg.listar());
			
			
			ArrayList<Profesores_x_Materias> listaProf_x_Mat = negPxM.listar();
			
			for(Profesores_x_Materias pxm : listaProf_x_Mat) {
				
				Materia materia = materiaNeg.traerMateria(pxm.getMateria().getId());				
				pxm.setMateria(materia);
			}
			
			request.setAttribute("listaProf_x_Mat", listaProf_x_Mat);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/CrearReserva.jsp");
			dispatcher.forward(request, response);
						
		}
		
		
		//CANCELAR RESERVA
		
		
			if(request.getParameter("cancelar") != null) 
			{
				int idReserva = Integer.parseInt(request.getParameter("cancelar").trim());
				Reserva reserva = new Reserva();
				reserva.setId(idReserva);
				
				boolean estado = neg.darBaja(reserva);
				
				if (estado) {
		        	response.sendRedirect("ServletReservas?Param=list");
		        } else {     
		        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar el aula");
		        }
			}
			
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//CREAR RESERVA
		
		if ("reservar".equals(request.getParameter("Param"))) {
		    
		    int aulaId = Integer.parseInt(request.getParameter("aulaId"));
		    String profesorId = request.getParameter("profesorId");
		    int materiaId = Integer.parseInt(request.getParameter("materiaId"));
		    Date fecha = java.sql.Date.valueOf(request.getParameter("fecha"));
		    //java.sql.Time horaInicio = java.sql.Time.valueOf(request.getParameter("horaInicio") + ":00");
		    //java.sql.Time horaFinal = java.sql.Time.valueOf(request.getParameter("horaFinal") + ":00");
		    
		    String horaInicioParam = request.getParameter("horaInicio");
		    int  horaInicioInt = Integer.parseInt(horaInicioParam);
		    java.sql.Time horaInicio = java.sql.Time.valueOf(horaInicioInt + ":00:00");
		    
		    String horaFinalParam = request.getParameter("horaFinal");
		    int  horaFinalInt = Integer.parseInt(horaFinalParam);
		    java.sql.Time horaFinal = java.sql.Time.valueOf(horaFinalInt + ":00:00");
		   
		    Reserva reserva = new Reserva();
		    reserva.setAula(new Aula(aulaId, null, 0)); 
		    reserva.setProfesor(new Profesor(profesorId));
		    reserva.setMateria(new Materia(materiaId)); 
		    reserva.setFecha(fecha);
		    reserva.setHoraInicio(horaInicio);
		    reserva.setHoraFinal(horaFinal);
		    reserva.setAdministrador(new Administrador("11111111"));
		    reserva.setEstado(true);

		   
		    
		    boolean insertado = neg.insert(reserva);

		    
		    if (insertado) {
		        request.setAttribute("mensaje", "Reserva creada exitosamente.");
		    } else {
		        request.setAttribute("mensaje", "Error al crear la reserva. Intenta de nuevo.");
		    }

		    RequestDispatcher dispatcher = request.getRequestDispatcher("CrearReserva.jsp");
		    dispatcher.forward(request, response);
		}
	
	}

}
