<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
		integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
		crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="styles.css"> <!-- Enlace al archivo CSS -->
	
	<title>Inicio</title>

</head>
<body>		
	<div id="bodyInicio">
		
		<div>
		<h1><p align="center">Reserva de aulas CURS </p></h1>
		<form id="formulario-inicio" method="post" action="Inicio.jsp">
			
		
			<label> Nombre de usuario: </label>
			<input type="text" name = "txtNombreUsuario" style="height: 22px; "> <br><br>
			<label> Contraseña: </label>
			<input type="password" name = "txtContrasenia" style="width: 156px; height: 21px; "><br><br> 
			<input type="submit" name= "btnAceptar" value="Aceptar" style="width: 157px; ">
			
		</form>
		</div>

	</div>
</body>
</html>