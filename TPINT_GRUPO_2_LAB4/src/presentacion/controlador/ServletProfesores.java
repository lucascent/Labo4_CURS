package presentacion.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Institucion;
import entidad.Profesor;
import negocioImpl.ProfesorNegocioImpl;


@WebServlet("/ServletProfesores")
public class ServletProfesores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    ProfesorNegocioImpl neg = new ProfesorNegocioImpl();
	
    public ServletProfesores() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// LISTAR
		
		if(request.getParameter("Param")!=null)
		{
			request.setAttribute("listaProfesores", neg.listar());	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarProfesores.jsp");
			dispatcher.forward(request, response);
		}
		
		// PROFESOR SELECCIONADO PARA ELIMINAR
		
		
		if (request.getParameter("dniParaEliminar") != null)
		{
			 String dni = request.getParameter("dniParaEliminar").trim();
			 Profesor profesor = neg.traerProfesor(dni);
			 
			 if (profesor != null) {
	                
	                request.setAttribute("profesor", profesor);	             
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/EliminarProfesor.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Profesor no encontrado");
	            }
		}
		
		
		// PROFESOR SELECCIONADO PARA EDITAR
		
	
		
		if(request.getParameter("dniParaEditar") != null)
		{
			String dni = request.getParameter("dniParaEditar").trim();
			Profesor profesor = neg.traerProfesor(dni);
			
			if(profesor != null) {
				request.setAttribute("profesor",profesor);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarProfesor.jsp");
				dispatcher.forward(request, response);
			}else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Profesor no encontrado");
			}
								
		}
		
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//CREAR PROFESOR
		
		if(request.getParameter("btnCrearProfesor") != null)
		{
			
			boolean estado = false;
			
			String dni = request.getParameter("Dni");
			String nombre = request.getParameter("FirstName");
			String apellido = request.getParameter("LastName");
			String telefono = request.getParameter("PhoneNumber");
			String email = request.getParameter("Email");
		
			Profesor profesor = new Profesor(dni,nombre,apellido,telefono,email);
			
			estado = neg.insert(profesor);	
			
			request.setAttribute("estado",estado);
			RequestDispatcher rd = request.getRequestDispatcher("/CrearProfesor.jsp");
			rd.forward(request,response);
			
		}
		
		
		// ELIMINAR PROFESOR
		
		
		
		
		if (request.getParameter("IdAEliminar") != null) 
		{
	            
			String dni = request.getParameter("IdAEliminar");
			Profesor profesor = new Profesor();
			profesor.setDni(dni);
	        boolean estado = neg.delete(profesor);

	        if (estado) {
	        	response.sendRedirect("ServletProfesores?Param=list");
	        } else {     
	        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar el aula");
	        }
		}
		
		
		//EDITAR PROFESOR
		
		if( request.getParameter("dniAeditar") != null) 
		{
			String dni = request.getParameter("dniAeditar");
            String nombre = request.getParameter("FirstName");
            String apellido = request.getParameter("LastName");
            String email = request.getParameter("Email");
            String telefono = request.getParameter("PhoneNumber");
            

           Profesor profesor = new Profesor(dni,nombre,apellido,telefono, email);
            boolean estado = neg.update(profesor); 

            if (estado) {
                response.sendRedirect("ServletProfesores?Param=list");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo editar el aula");
            }
		}
		
		
	}

}
