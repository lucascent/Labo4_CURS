<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
        crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Enlace al archivo CSS -->


<title>Gestión de aulas</title>
</head>

  <style>
        
        .table-container {
            margin: 20px auto;
            width: 80%; 
        }
   </style>
    
<body>

	<div id="body-gestion-aulas">
       
        <div class="bubble-gestion-aulas">
        	<div class="table-container">
        	 	<h1 class="text-center">Gestión de Aulas</h1>
           	 	<table class="table table-bordered">
                	<thead>
                   	 	<tr>
                        	<th>ID Aula</th>
                        	<th>Nombre Aula</th>
                        	<th>Capacidad</th>
                        	<th>Acciones</th>
                    	</tr>
                	</thead>
               		 <tbody>
                    	<!-- datos de las aulas -->
                   		 <tr>
                        	<td>1</td>
                        	<td>Aula 101</td>
                        	<td>30</td>
                        	<td>
                            	<a href="modificarAula.jsp?id=1" class="btn btn-warning btn-sm">Modificar</a>
                            	<a href="eliminarAula.jsp?id=1" class="btn btn-danger btn-sm">Eliminar</a>
                       		 </td>
                    	</tr>
                   		 <tr>
                       		 <td>2</td>
                        	<td>Aula 102</td>
                        	<td>25</td>
                       		 <td>
                            	<a href="modificarAula.jsp?id=2" class="btn btn-warning btn-sm">Modificar</a>
                            	<a href="eliminarAula.jsp?id=2" class="btn btn-danger btn-sm">Eliminar</a>
                       		 </td>
                    	</tr>
                   		 <!-- Agrega más filas según sea necesario -->
                	</tbody>
            	</table>
            	<a href="agregarAula.jsp" class="btn btn-success">Agregar Aula</a>
        	</div>
        </div>
    </div>
</body>
</html>