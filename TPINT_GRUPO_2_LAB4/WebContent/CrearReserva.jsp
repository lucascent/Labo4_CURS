<%@ page import = "entidad.*" %>
<%@ page import = "java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de Usuario - Gestion De Aulas</title>
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="/css/styles.css?v=rU3HU1QSfkxPJ0-lQ0ZvVUMHCvb42LZ_1gaDqGPHD-c">
    <link rel="stylesheet" href="/css/site.css?v=eosHg4ZhvtgkBfUZkaEBebp3gtfCrK_1R3e0nwILrnc">
    <link rel="stylesheet" href="/GestionDeAulas.styles.css?v=I1fNPcq-pkXH6WjNPv20YwCQmuK3uJFx2WuWZVc9ebo">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>
<body>
		<% 
		List<Materia> listaMaterias = new ArrayList<Materia>();
		if (request.getAttribute("listaMaterias") != null) {
			listaMaterias = (List<Materia>) request.getAttribute("listaMaterias");
		}


		List<Profesor> listaProfesores = new ArrayList<Profesor>();
		if (request.getAttribute("listaProfesores") != null) {
			listaProfesores= (List<Profesor>) request.getAttribute("listaProfesores");
		}
		
		List<Profesores_x_Materias> listaProf_x_Mat = new ArrayList<Profesores_x_Materias>();
		if (request.getAttribute("listaProf_x_Mat") != null) {
			listaProf_x_Mat = (List<Profesores_x_Materias>) request.getAttribute("listaProf_x_Mat");
		}
		
		
		List<Aula> listaA = new ArrayList<Aula>();  
		if (request.getAttribute("listaAulas") != null) {
			listaA = (List<Aula>) request.getAttribute("listaAulas");
		}
		%>
		
		<% 
	 String fecha = (String) request.getAttribute("fecha");
    String profesor = (String) request.getAttribute("profesor");
    String materia = (String) request.getAttribute("materia");
    Integer numeroEstudiantes = (Integer) request.getAttribute("numeroEstudiantes");
    Integer horaInicio = (Integer) request.getAttribute("horaInicio");
    Integer horaFinal = (Integer) request.getAttribute("horaFinal");
	%>
		
		

    <header b-dk557gbzy5="" class="m-1 rounded-md p-2 shadow-md shadow-gray-500">
        <div b-dk557gbzy5="" class="m-4 flex flex-row items-center justify-between align-middle">
            <a class="my-auto flex flex-col items-center justify-center" href="/">
                <h1 b-dk557gbzy5="" class="h-fit p-1 text-6xl font-bold text-green-600">CURS</h1>
                <h2 b-dk557gbzy5="" class="h-fit p-1 text-4xl font-bold text-red-600">Gestion de Aulas</h2>
            </a>
            <div b-dk557gbzy5="">
                <a class="cursor-pointer text-blue-800 no-underline" href="/Account/Login">Ingresar</a>
                <a class="pointer-events-auto text-blue-800 no-underline" href="/Account/Register">Registrarse</a>
            </div>
        </div>
    </header>
    
        <main b-dk557gbzy5="" role="main" class="w-full px-4 pt-2">
        
        <section class="flex min-h-dvh w-full flex-col items-center">
    <h2 class="w-full bg-gray-900 p-4 text-center text-6xl font-bold text-gray-50">Reservar Aula</h2>
    <form class="flex h-full w-2/3 flex-col items-center justify-center rounded-md py-4" method="POST" action="ServletAulas?Param=verDisponibilidad">
        
        <div class="flex w-2/3 flex-col self-center">
            <label for="Date">Fecha de reserva</label>
            <input type="date" class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" data-val-required="Debes definir la fecha" id="Date" name="Date" value=""><input name="__Invariant" type="hidden" value="Date">
            <span class="text-red-600 field-validation-valid" data-valmsg-for="Date" data-valmsg-replace="true"></span>
        </div>
		<div class="flex flex-col w-2/3 self-center my-2">
    		<label for="ProfesorId" class="font-bold text-gray-700">Seleccionar Profesor</label>
			<select class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" 
				 data-val-required="El profesor es un campo requerido." id="ProfesorId" name="ProfesorId">
				  <% for (Profesor profesorItem : listaProfesores) { %>
				      <option value="<%= profesorItem.getDni() %>"><%= profesorItem.getNombre() %> <%= profesorItem.getApellido() %></option>
				   <% } %>
			</select>
		</div>
		<div class="flex flex-col w-2/3 self-center my-2">
			<label for="MateriaId">Materia</label>
			<select class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" 
				 data-val-required="La materia es un campo requerido." id="MateriaId" name="MateriaId">
								  <% for (Materia materiaItem : listaMaterias) { %>
				      <option value="<%= materiaItem.getId() %>"><%= materiaItem.getNombre() %></option>
			   <% } %>
			</select>
		</div>
        <div class="flex w-2/3 flex-col self-center">
            <label for="Students">Numero de Estudiantes</label>
            <input type="number" class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" data-val-required="Debes definir el numero de alumnos" id="Students" name="Students" value=""><input name="__Invariant" type="hidden" value="Students">
            <span class="text-red-600 field-validation-valid" data-valmsg-for="Students" data-valmsg-replace="true"></span>
        </div>
        <div class="flex w-2/3 flex-col self-center">
            <label for="Hour">Hora de inicio de la clase</label>
            <input type="number" min="0" max="23" class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" data-val-required="Hora de inicio" id="Hour" name="Hour" value=""><input name="__Invariant" type="hidden" value="Hour">
            <span class="text-red-600 field-validation-valid" data-valmsg-for="Hour" data-valmsg-replace="true"></span>
        </div>
        <div class="flex w-2/3 flex-col self-center">
            <label for="TotalHours">Horas de la reserva</label>
            <input type="number" class="border-2 mx-1 rounded-md border-gray-900 p-1" data-val="true" data-val-required="Debes definir el numero de horas de la reserva" id="TotalHours" name="TotalHours" value=""><input name="__Invariant" type="hidden" value="TotalHours">
            <span class="text-red-600 field-validation-valid" data-valmsg-for="TotalHours" data-valmsg-replace="true"></span>
        </div>

        <div class="flex w-2/3 justify-between">
            <button type="submit" href= "ServletAulas?Param=verDisponibilidad" class="mt-4 w-48 rounded-md border border-transparent bg-gradient-to-tr from-blue-800 to-blue-700 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-slate-700 focus:bg-slate-700 focus:shadow-none active:bg-slate-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
                <i class="fa fa-search" aria-hidden="true"></i>  Ver Disponibilidad de aulas
            </button>
            <a class="mt-4 w-48 rounded-md border border-transparent bg-gradient-to-tr from-green-800 to-green-700 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-slate-700 focus:bg-slate-700 focus:shadow-none active:bg-slate-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" href="ServletReservas?Param=list">
                Volver
            </a>

        </div>


    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT4ldrUeeExMw7HNV_TJMJuy3DGZY76gdsBQ60gSzPbLCuBEzvQsILFnjeLZ9B4xuWBv-Plg96BZRNOsHc4WZ2JtZyJ0O7WSBtYqSqG0_2ECMl9yze8UQCfyxsjIA4f9FrM"></form>
    <h2 class="w-full bg-gray-900 p-4 text-center text-6xl font-bold text-gray-50">Crear Reserva</h2>
    <form class="flex h-full w-2/3 flex-col items-center justify-center rounded-md py-4" action="ServletReservas?Param=reservar" method="post">
    
    <section class="flex flex-col items-center w-full mt-4">
    <h3 class="text-xl font-bold">Detalles de la Reserva</h3>
    <p class="text-gray-700">
        <strong>Profesor:</strong> <%= profesor != null ? profesor : "N/A" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Materia:</strong> <%= materia != null ? materia : "N/A" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Estudiantes:</strong> <%= numeroEstudiantes != null ? numeroEstudiantes : "N/A" %> &nbsp;&nbsp;|&nbsp;&nbsp;
         <strong>Fecha:</strong> <%= fecha != null ? fecha : "N/A" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Hora de Inicio:</strong> <%= horaInicio != null ? horaInicio + ":00" : "N/A" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Hora de Fin:</strong> <%= horaFinal != null ? horaFinal + ":00" : "N/A" %>
    </p>
	</section>
	
       <table class="w-full min-w-max table-auto text-left">
    <thead>
        <tr>
            <th>Nombre del Aula</th>
            <th>Capacidad</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <% if (listaA != null && !listaA.isEmpty()) { %>
            <% for (Aula aula : listaA) { %>
                <tr>
                    <td><%= aula.getNombre() %></td>
                    <td><%= aula.getCapacidad() %></td>
                    <td>
                        <form action="ServletReservas?Param=reservar" method="POST">
                            <input type="hidden" name="aulaId" value="<%= aula.getId() %>" />
                            <input type="hidden" name="fecha" value="<%= request.getParameter("Date") %>" />
                            <input type="hidden" name="horaInicio" value="<%= request.getParameter("Hour") %>" />
                            <input type="hidden" name="horaFinal" value="<%= Integer.parseInt(request.getParameter("Hour")) + Integer.parseInt(request.getParameter("TotalHours")) %>" />
                             <input type="hidden" name="profesorId" value="<%= request.getParameter("ProfesorId") %>" />
    						<input type="hidden" name="materiaId" value="<%= request.getParameter("MateriaId") %>" />
                            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md">Reservar</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="3">No hay aulas disponibles.</td>
            </tr>
        <% } %>
    </tbody>
</table>
       


    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT4ldrUeeExMw7HNV_TJMJuy3DGZY76gdsBQ60gSzPbLCuBEzvQsILFnjeLZ9B4xuWBv-Plg96BZRNOsHc4WZ2JtZyJ0O7WSBtYqSqG0_2ECMl9yze8UQCfyxsjIA4f9FrM">
</form></section>

        </main>
        
        
        <script>
        // Cargar las materias asociadas al profesor seleccionado
        const profesorMaterias = {};

        <% for (Profesores_x_Materias relacion : listaProf_x_Mat) { %>
            if (!profesorMaterias["<%= relacion.getProfesor().getDni() %>"]) {
                profesorMaterias["<%= relacion.getProfesor().getDni() %>"] = [];
            }
            profesorMaterias["<%= relacion.getProfesor().getDni() %>"].push({
                id: "<%= relacion.getMateria().getId() %>",
                nombre: "<%= relacion.getMateria().getNombre() %>"
            });
        <% } %>

        function cargarMaterias(profesorId) {
            const materiasDropdown = document.getElementById("MateriaId");

            // Limpiar opciones previas
            materiasDropdown.innerHTML = '<option value="">Seleccione una materia</option>';

            if (profesorId && profesorMaterias[profesorId]) {
                profesorMaterias[profesorId].forEach(materia => {
                    const option = document.createElement("option");
                    option.value = materia.id;
                    option.textContent = materia.nombre;
                    materiasDropdown.appendChild(option);
                });
            }
        }

        document.getElementById("ProfesorId").addEventListener("change", function () {
            const profesorId = this.value;
            cargarMaterias(profesorId);
        });

        // Ejecutar al cargar la página para seleccionar las materias del primer profesor
        window.onload = function () {
            const profesorIdInicial = document.getElementById("ProfesorId").value;
            cargarMaterias(profesorIdInicial);
        };
	</script>
    

    <script src="/lib/jquery/dist/jquery.min.js"></script>

    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
    

<!-- Visual Studio Browser Link -->
<script type="text/javascript" src="/_vs/browserLink" async="async" id="__browserLink_initializationData" data-requestid="2f8998a884764702a38b28b8792bed9d" data-requestmappingfromserver="false" data-connecturl="http://localhost:54306/d44215c8dbef47c699c036401f907765/browserLink"></script>
<!-- End Browser Link -->
<script src="/_framework/aspnetcore-browser-refresh.js"></script>

</body></html>