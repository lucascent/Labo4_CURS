package presentacion.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocioImpl.CarreraNegocioImpl;
import negocioImpl.InstitucionNegocioImpl;
import entidad.Institucion;
import entidad.Profesor;
import entidad.Carrera;
import java.util.*;


@WebServlet("/ServletCarreras")
public class ServletCarreras extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CarreraNegocioImpl neg = new CarreraNegocioImpl();
	

    public ServletCarreras() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// LISTAR
		
		if("list".equals(request.getParameter("Param")))
		{
			request.setAttribute("listaCarreras", neg.listar());	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarCarreras.jsp");
			dispatcher.forward(request, response);
		}
		
		//LLENAR DESCOLGABLE DE INSTITUCIONES
		if("instituciones".equals(request.getParameter("Param")))
		{
					
		InstitucionNegocioImpl institucionNeg = new InstitucionNegocioImpl();
      
       
        request.setAttribute("listaInstituciones", institucionNeg.listar());
        request.getRequestDispatcher("/CrearCarrera.jsp").forward(request, response);
		}
		
		//CARRERA SELECCIONADA PARA EDITAR
		
		String idAEditar =request.getParameter("Editar");
		
		if(idAEditar != null)
		{
			int id = Integer.parseInt(idAEditar);
			Carrera carrera = neg.traerCarrera(id);
			
			InstitucionNegocioImpl institucionNeg = new InstitucionNegocioImpl();
	        List<Institucion> listaInstituciones = institucionNeg.listar();
			
			if(carrera != null && listaInstituciones != null) {
				    
				request.setAttribute("carrera",carrera);
				request.setAttribute("listaInstituciones", listaInstituciones);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarCarrera.jsp");
				dispatcher.forward(request, response);
			}else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Carrera no encontrada");
			}
								
		}
		
		//DAR DE BAJA CARRERA
		
		
		if(request.getParameter("eliminar") != null)
		{
			int id = Integer.parseInt(request.getParameter("eliminar").trim());
			Carrera carrera = new Carrera();
			carrera.setId(id);
	        boolean estado = neg.delete(carrera);

	        if (estado) {
	        	response.sendRedirect("ServletCarreras?Param=list");
	        } else {     
	        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar la carrera");
	        }
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//CREAR CARRERA
		
		if(request.getParameter("btnCrearCarrera") != null)
		{
			boolean estado = false;
			String nombre = request.getParameter("Name");
			int idInstitucion = Integer.parseInt(request.getParameter("InstitucionId"));
			Institucion institucion = new Institucion();
			institucion.setId(idInstitucion);
			Carrera carrera = new Carrera();
			carrera.setNombre(nombre);
			carrera.setInstitucion(institucion);
			
			estado = neg.insert(carrera);	
			
			request.setAttribute("estado",estado);
			RequestDispatcher rd = request.getRequestDispatcher("/CrearCarrera.jsp");
			rd.forward(request,response);
			
		}
		
		
		// EDITAR CARRERA
		
		
			if( request.getParameter("EditarCarrera") != null) 
			{
				int id = Integer.parseInt(request.getParameter("EditarCarrera").trim());
				String nombre = request.getParameter("Name").trim();
				int idInstitucion = Integer.parseInt(request.getParameter("InstitucionId").trim());
				Institucion institucion = new Institucion();
				institucion.setId(idInstitucion);
				
				Carrera carrera = new Carrera(id,institucion, nombre);
			
 
		        boolean estado = neg.update(carrera); 

		        if (estado) {
		            response.sendRedirect("ServletCarreras?Param=list");
		       	} else {
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo editar el aula");
		       	}
			}	
	}

}
