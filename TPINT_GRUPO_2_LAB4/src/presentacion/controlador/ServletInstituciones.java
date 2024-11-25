package presentacion.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Institucion;
import negocioImpl.InstitucionNegocioImpl;


@WebServlet("/ServletInstituciones")
public class ServletInstituciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	InstitucionNegocioImpl neg = new InstitucionNegocioImpl();
	
	
    public ServletInstituciones() {
        super();
        
    }

	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// LISTAR
		
		if(request.getParameter("Param")!=null)
		{
			request.setAttribute("listaInstituciones", neg.listar());	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarInstituciones.jsp");
			dispatcher.forward(request, response);
		}
		
		
		// INSTITUCION SELECCIONADA PARA ELIMINAR
		
				String idInstitucion =request.getParameter("idEliminar");
				
				if (idInstitucion != null)
				{
					 int id = Integer.parseInt(request.getParameter("idEliminar"));
					 Institucion institucion = neg.traerInstitucion(id);
					 
					 if (institucion != null) {
			                
			                request.setAttribute("institucion", institucion);	             
			                RequestDispatcher dispatcher = request.getRequestDispatcher("/EliminarInstitucion.jsp");
			                dispatcher.forward(request, response);
			            } else {
			                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Aula no encontrada");
			            }
				}	
				
				
				// INSTITUCION SELECCIONADA PARA EDITAR
				
				String idAEditar =request.getParameter("idEditar");
				
				if(idAEditar != null)
				{
					int id = Integer.parseInt(idAEditar);
					Institucion institucion = neg.traerInstitucion(id);
					
					if(institucion != null) {
						request.setAttribute("institucion",institucion);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarInstitucion.jsp");
						dispatcher.forward(request, response);
					}else {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Aula no encontrada");
					}
										
				}
		
				
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//CREAR INSTITUCION 
		
		
		if(request.getParameter("btnCrearInstitucion") != null)
		{
			boolean estado = false;
			String nombre = request.getParameter("Name");
			
			Institucion institucion = new Institucion();
			institucion.setNombre(nombre);
			
			estado = neg.insert(institucion);	
			
			request.setAttribute("estado",estado);
			RequestDispatcher rd = request.getRequestDispatcher("/CrearInstitucion.jsp");
			rd.forward(request,response);
			
		}
		

		// ELIMINAR INSTITUCION
		
		
		String idAEliminar = request.getParameter("idAeliminar");
		
		if (idAEliminar != null) 
		{
	            
			int id = Integer.parseInt(idAEliminar);
			Institucion institucion = new Institucion();
			institucion.setId(id);
	        boolean estado = neg.delete(institucion);

	        if (estado) {
	        	response.sendRedirect("ServletInstituciones?Param=list");
	        } else {     
	        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar el aula");
	        }
		}
		
		
	// EDITAR INSTITUCION
		
		
		if( request.getParameter("idAeditar") != null) 
		{
			int id = Integer.parseInt(request.getParameter("idAeditar").trim());
            String nombre = request.getParameter("Name");
            

           Institucion institucion = new Institucion(id,nombre);
            boolean estado = neg.update(institucion); 

            if (estado) {
                response.sendRedirect("ServletInstituciones?Param=list");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo editar el aula");
            }
		}
		
		
	}
	
	
}
