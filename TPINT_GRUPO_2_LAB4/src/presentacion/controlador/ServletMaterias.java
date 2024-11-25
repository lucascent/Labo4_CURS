package presentacion.controlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Materia;
import entidad.Profesor;
import entidad.Institucion;
import entidad.Aula;
import entidad.Carrera;
import entidad.Profesores_x_Materias;
import entidad.Reserva;
import negocioImpl.*;


@WebServlet("/ServletMaterias")
public class ServletMaterias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	MateriaNegocioImpl neg = new MateriaNegocioImpl();
	InstitucionNegocioImpl negInstitucion = new InstitucionNegocioImpl();
	CarreraNegocioImpl negCarrera = new CarreraNegocioImpl();
	ProfesorNegocioImpl negProfesor = new ProfesorNegocioImpl();
	PxMNegocioImpl negPxm = new PxMNegocioImpl();
	
	
    public ServletMaterias() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// LISTAR
		
			if("list".equals(request.getParameter("Param")))
			{
				 ArrayList<Profesores_x_Materias> listaPxM = negPxm.listar();
										
				 for (Profesores_x_Materias pxm : listaPxM) {
					 Profesor profesor = negProfesor.traerProfesor(pxm.getProfesor().getDni()); 	                                            
		             pxm.setProfesor(profesor);		          	            
		         }
				
				
				request.setAttribute("listaMaterias", neg.listar());
				request.setAttribute("listaProf_x_Mat" , listaPxM);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarMaterias.jsp");
				dispatcher.forward(request, response);
			}
				
				// MATERIA SELECCIONADA PARA ELIMINAR
	/*			
				
			if (request.getParameter("eliminar") != null)
			{
				int id = Integer.parseInt(request.getParameter("idParaEliminar"));
				Profesor profesor = neg.traerMateria(id);
					 
				if (profesor != null) {
			                
			          request.setAttribute("materia", materia);	             
			          RequestDispatcher dispatcher = request.getRequestDispatcher("/EliminarMateria.jsp");
			          dispatcher.forward(request, response);
				} else {
			          response.sendError(HttpServletResponse.SC_NOT_FOUND, "Materia no encontrada");
			           }
				}
			*/	
				
			// LISTAS PARA CREAR MATERIA
				
			if("datos".equals(request.getParameter("Param")))
			{
				request.setAttribute("listaInstituciones",negInstitucion.listar());
				request.setAttribute("listaCarreras", negCarrera.listar());
				request.setAttribute("listaProfesores", negProfesor.listar());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/CrearMateria.jsp");
				dispatcher.forward(request, response);
							
			}
			
			
			
			// MATERIA SELECCIONADA PARA EDITAR
				
				if(request.getParameter("idParaEditar") != null)
				{
					int id = Integer.parseInt(request.getParameter("idParaEditar").trim());
   					Materia materia = neg.traerMateria(id);
   					
		
					if(materia != null) {
						request.setAttribute("materia",materia);
						request.setAttribute("listaPxM", negPxm.listar());
						request.setAttribute("listaProfesores", negProfesor.listar());
						request.setAttribute("listaCarreras", negCarrera.listar());
						request.setAttribute("listaInstituciones", negInstitucion.listar());
						RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarMateria.jsp");
						dispatcher.forward(request, response);
					}else {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Materia no encontrada");
					}
										
				}
				
				
				// ELIMINAR MATERIA
				
				
				
				
				if (request.getParameter("eliminar") != null) 
				{
			            
					int id = Integer.parseInt(request.getParameter("eliminar").trim());
					Materia materia = new Materia();
					materia.setId(id);
			        boolean estado = neg.delete(materia);

			        if (estado) {
			        	response.sendRedirect("ServletMaterias?Param=list");
			        } else {     
			        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar la materia");
			        }
				}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//CREAR MATERIA
		
		if(request.getParameter("btnCrearMateria") != null)
		{
			
			int idActual;
			boolean estadoPxm= false;
			
			String nombre = request.getParameter("Name");
			String dniProfesor = request.getParameter("ProfesorId");
			int idCarrera = Integer.parseInt(request.getParameter("CarreraId"));
			int idInstitucion = Integer.parseInt(request.getParameter("InstitucionId"));
			
			Profesor profesor = new Profesor();
			profesor.setDni(dniProfesor);
			
			Institucion institucion = new Institucion();
			institucion.setId(idInstitucion);
			
			Carrera carrera = new Carrera();
			carrera.setId(idCarrera);
			
			
			
			Materia materia = new Materia();
			materia.setNombre(nombre);
			materia.setCarrera(carrera);
			materia.setInstitucion(institucion);
					
			idActual = neg.insert(materia);			
			materia.setId(idActual);
			
			Profesores_x_Materias pxm = new Profesores_x_Materias(profesor,materia);
			
			estadoPxm = negPxm.insert(pxm);
			
			//request.setAttribute("estado",estado);
			RequestDispatcher rd = request.getRequestDispatcher("/CrearMateria.jsp");
			rd.forward(request,response);
			
		}
		
		
		// ELIMINAR MATERIA
		
		
	
		
		if (request.getParameter("eliminar") != null) 
		{
	            
			int id = Integer.parseInt(request.getParameter("eliminar"));
			Materia materia = new Materia();
			materia.setId(id);
	        boolean estado = neg.delete(materia);

	        if (estado) {
	        	response.sendRedirect("ServletMaterias?Param=list");
	        } else {     
	        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar la materia");
	        }
		}
		
	
		//EDITAR MATERIA
		
		if( request.getParameter("EditarMateria") != null) 
		{
			int idMateria = Integer.parseInt(request.getParameter("EditarMateria").trim());
			String nombre = request.getParameter("Nombre");
			String dniProfesor = request.getParameter("ProfesorId");
			Profesor profesor = new Profesor();
			profesor.setDni(dniProfesor);
			int idCarrera = Integer.parseInt(request.getParameter("CarreraId"));
			Carrera carrera = negCarrera.traerCarrera(idCarrera);
			
			Institucion institucion = new Institucion();
			institucion.setId(carrera.getInstitucion().getId());
			
			//TRAER INSTITUCION
            

            Materia materia = new Materia(idMateria,carrera,institucion,nombre);
            boolean estado = neg.update(materia); 

            if (estado) {
                response.sendRedirect("ServletMaterias?Param=list");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo editar la materia");
            }
		}
		
	}

}
