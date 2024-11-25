<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<title>Administrador CURS</title>
</head>

<body>

	<div id="body-menu-admin">		
		<div class="bubble">
			<h1> Administrador </h1>
			<br>
			<!-- Hipervínculo a la página de Gestión de Aulas -->
		
			<a href="ServletReservas?Param=list" class="admin-link">Reservas de aulas</a> <br><br>
			
			<a href="ServletAulas?Param=list" class="admin-link">Aulas</a> <br><br>
			<!-- Hipervínculo a la página de Gestión de Profesores -->
			<a href="ServletProfesores?Param=List" class="admin-link">Profesores</a> <br><br>
			
			<a href="ServletInstituciones?Param=list" class="admin-link">Instituciones</a> <br><br>
			
			<a href="ServletCarreras?Param=list" class="admin-link">Carreras</a><br><br>
			
			<a href="ServletMaterias?Param=list" class="admin-link">Materias</a><br><br>
		</div>
	
	</div>
</body>
</html>