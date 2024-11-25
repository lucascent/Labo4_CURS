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
			    <h2 class="w-full bg-gray-900 p-4 text-center text-6xl font-bold text-gray-50">Borrar Reserva</h2>
			    <form class="flex h-full w-2/3 flex-col items-center justify-center rounded-md py-4" method="POST" action="/Reserve/Search">
			        
			        <input type="hidden">
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="Date">Fecha de reserva</label>
			            <input type="date" class="border-2 mx-1 rounded-md border-gray-900 p-1" disabled="" data-val="true" data-val-required="Debes definir la fecha" id="Date" name="Date" value=""><input name="__Invariant" type="hidden" value="Date">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="Date" data-valmsg-replace="true"></span>
			        </div>
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="EndDate">Fecha de Fin de Reserva</label>
			            <input type="date" class="border-2 mx-1 rounded-md border-gray-900 p-1" disabled="" data-val="true" data-val-required="The Fecha de Fin de Reserva field is required." id="EndDate" name="EndDate" value=""><input name="__Invariant" type="hidden" value="EndDate">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="EndDate" data-valmsg-replace="true"></span>
			        </div>
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="Students">Numero de Estudiantes</label>
			            <input type="number" class="border-2 mx-1 rounded-md border-gray-900 p-1" disabled="" data-val="true" data-val-required="Debes definir el numero de alumnos" id="Students" name="Students" value=""><input name="__Invariant" type="hidden" value="Students">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="Students" data-valmsg-replace="true"></span>
			        </div>
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="Hour">Hora de inicio de la clase</label>
			            <input type="number" class="border-2 mx-1 rounded-md border-gray-900 p-1" disabled="" data-val="true" data-val-required="Hora de inicio" id="Hour" name="Hour" value=""><input name="__Invariant" type="hidden" value="Hour">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="Hour" data-valmsg-replace="true"></span>
			        </div>
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="TotalHours">Horas de la reserva</label>
			            <input type="number" class="border-2 mx-1 rounded-md border-gray-900 p-1" disabled="" data-val="true" data-val-required="Debes definir el numero de horas de la reserva" id="TotalHours" name="TotalHours" value=""><input name="__Invariant" type="hidden" value="TotalHours">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="TotalHours" data-valmsg-replace="true"></span>
			        </div>
			
			        <div class="flex w-2/3 justify-between">
			            <button type="submit" class="mt-4 w-48 rounded-md border border-transparent bg-gradient-to-tr from-red-800 to-red-700 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-red-700 focus:bg-red-700 focus:shadow-none active:bg-slate-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
			                <i class="fa fa-trash" aria-hidden="true"></i>  Eliminar
			            </button>
			            <a class="mt-4 w-48 rounded-md border border-transparent bg-gradient-to-tr from-green-800 to-green-700 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-slate-700 focus:bg-slate-700 focus:shadow-none active:bg-slate-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" href="/ClassRoom">
			                Volver
			            </a>
			
			        </div>
			
			
			    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT6upXwD0eFv7breewfWggjbf4fajQLTwARjDGn3gfSXlOd7iexCYBL2c-zT9cCAFXPf4dIAcq477cp2VIVmwcKtZnEYtMaY1anfaNe2Mn73f1vyZxdod19hdFI6EpJCAhc"></form>
			    <h2 class="w-full bg-gray-900 p-4 text-center text-6xl font-bold text-gray-50">Detalles de Reserva</h2>
			    <form class="flex h-full w-2/3 flex-col items-center justify-center rounded-md py-4" action="/Reserve/Create" method="post">
			        <table class="w-full min-w-max table-auto text-left">
			            <thead>
			                <tr>
			                    <th class="border-b border-slate-500 bg-slate-800 p-4 transition-colors hover:bg-slate-900">
			                        <p class="flex items-center justify-between gap-2 text-sm font-normal leading-none text-slate-50">
			                            Numero de Aula
			                        </p>
			                    </th>
			
			                    <th class="border-b border-slate-500 bg-slate-800 p-4 transition-colors hover:bg-slate-900">
			                        <p class="flex items-center justify-between gap-2 text-sm font-normal leading-none text-slate-50">
			                            Capacidad
			
			                        </p>
			                    </th>
			                    <th class="border-b border-slate-500 bg-slate-800 p-4 transition-colors hover:bg-slate-900">
			                        <p class="flex items-center justify-between gap-2 text-sm font-normal leading-none text-slate-50">
			                            Responsable
			                        </p>
			                    </th>
			                    <th class="border-b border-slate-500 bg-slate-800 p-4 transition-colors hover:bg-slate-900">
			                        <p class="flex items-center justify-between gap-2 text-sm font-normal leading-none text-slate-50">
			                            Materia
			                        </p>
			                    </th>
			
			                    <th class="border-b border-slate-500 bg-slate-800 p-4 transition-colors hover:bg-slate-900">
			                        <p class="flex items-center justify-between gap-2 text-sm font-normal leading-none text-slate-50">
			                            Acciones
			                        </p>
			                    </th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr class="hover:bg-slate-50">
			                    
			                    <td class="border-b border-slate-200 p-4">
			                        <p class="block text-sm text-slate-800">
			                            7
			                        </p>
			                    </td>
			                    <td class="border-b border-slate-200 p-4">
			                        <p class="block text-sm text-slate-800">
			                            32
			                        </p>
			                    </td>
			                    <td class="border-b border-slate-200 p-4">
			                        <p class="block text-sm text-slate-800">
			                            Ariel Bollini
			                        </p>
			                    </td>
			                    <td class="border-b border-slate-200 p-4">
			                        <p class="block text-sm font-bold text-green-800">
			                            Laboratorio 3
			                        </p>
			                    </td>
			
			                    <td class="flex justify-end border-b border-slate-200 p-4">
			                        <button type="submit" class="ml-2 rounded-md border border-transparent bg-blue-600 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-blue-700 focus:bg-blue-700 focus:shadow-none active:bg-blue-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
			                            <i class="fa fa-plus" aria-hidden="true"></i>
			                            Reservar
			                        </button>
			                    </td>
			    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT6upXwD0eFv7breewfWggjbf4fajQLTwARjDGn3gfSXlOd7iexCYBL2c-zT9cCAFXPf4dIAcq477cp2VIVmwcKtZnEYtMaY1anfaNe2Mn73f1vyZxdod19hdFI6EpJCAhc">
			    </tr>
			    </tbody>
			    </table>
			
			
			    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT6upXwD0eFv7breewfWggjbf4fajQLTwARjDGn3gfSXlOd7iexCYBL2c-zT9cCAFXPf4dIAcq477cp2VIVmwcKtZnEYtMaY1anfaNe2Mn73f1vyZxdod19hdFI6EpJCAhc">
			</form></section>

        </main>
    

    <script src="/lib/jquery/dist/jquery.min.js"></script>

    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
    

<!-- Visual Studio Browser Link -->
<script type="text/javascript" src="/_vs/browserLink" async="async" id="__browserLink_initializationData" data-requestid="2f8998a884764702a38b28b8792bed9d" data-requestmappingfromserver="false" data-connecturl="http://localhost:54306/d44215c8dbef47c699c036401f907765/browserLink"></script>
<!-- End Browser Link -->
<script src="/_framework/aspnetcore-browser-refresh.js"></script>

</body></html>