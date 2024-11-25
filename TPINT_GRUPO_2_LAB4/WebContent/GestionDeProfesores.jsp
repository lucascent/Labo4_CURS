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

    <title>Gestión de Profesores</title>
    
    <style>
        .table-container {
            margin: 20px auto; /* Centra la tabla */
            width: 80%; /* Ajusta el ancho de la tabla */
        }
    </style>
</head>

<body>

    <div id="body-gestion-aulas">
    	<div class="bubble-gestion-aulas">
	        <h1 class="text-center">Gestión de Profesores</h1>
	        
	        <div class="table-container">
	            <table class="table table-bordered">
	                <thead>
	                    <tr>
	                        <th>ID Profesor</th>
	                        <th>Nombre</th>
	                        <th>Apellido</th>
	                        <th>Asignatura</th>
	                        <th>Acciones</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <!-- Aquí irán los datos de los profesores -->
	                    <tr>
	                        <td>1</td>
	                        <td>Juan</td>
	                        <td>Pérez</td>
	                        <td>Matemáticas</td>
	                        <td>
	                            <a href="modificarProfesor.jsp?id=1" class="btn btn-warning btn-sm">Modificar</a>
	                            <a href="eliminarProfesor.jsp?id=1" class="btn btn-danger btn-sm">Eliminar</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td>María</td>
	                        <td>González</td>
	                        <td>Historia</td>
	                        <td>
	                            <a href="modificarProfesor.jsp?id=2" class="btn btn-warning btn-sm">Modificar</a>
	                            <a href="eliminarProfesor.jsp?id=2" class="btn btn-danger btn-sm">Eliminar</a>
	                        </td>
	                    </tr>
	                    <!-- Agrega más filas según sea necesario -->
	                </tbody>
	            </table>
	            <a href="agregarProfesor.jsp" class="btn btn-success">Agregar Profesor</a>
	        </div>
	    </div>
    </div>