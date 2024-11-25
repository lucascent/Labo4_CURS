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
			    <h2 class="w-full bg-gray-900 p-4 text-center text-6xl font-bold text-gray-50">Ingreso al sistema</h2>
			    <form class="flex h-full w-2/3 flex-col items-center justify-center rounded-md py-4" method="POST" action="/Account/Login">
			        
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="UserNama">Nombre de Usuario</label>
			            <input class="border-2 mx-1 rounded-md border-gray-900 p-1" type="email" data-val="true" data-val-email="The Nombre de Usuario field is not a valid e-mail address." data-val-required="The Nombre de Usuario field is required." id="UserNama" name="UserNama" value="">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="UserNama" data-valmsg-replace="true"></span>
			        </div>
			        <div class="flex w-2/3 flex-col self-center">
			            <label for="Password">Contraseņa</label>
			            <input class="border-2 mx-1 rounded-md border-gray-900 p-1" type="password" data-val="true" data-val-required="The Contraseņa field is required." id="Password" name="Password" value="">
			            <span class="text-red-600 field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
			        </div> 
			        <div class="mt-2 flex w-2/3 justify-between">
			        <div class="flex place-items-center align-middle">
			            <label for="Persist">Recuerdame</label>
			        <input type="checkbox" class="peer mx-2 h-5 w-5 cursor-pointer appearance-none rounded border border-slate-300 py-1 shadow transition-all checked:bg-slate-800 checked:border-slate-800 hover:shadow-md" data-val="true" data-val-required="The Recuerdame field is required." id="Persist" name="Persist" value="true">
			            </div>
			            <button type="submit" class="ml-2 rounded-md border border-transparent bg-blue-600 px-4 py-2 text-center text-sm text-white shadow-md transition-all hover:shadow-lg hover:bg-blue-700 focus:bg-blue-700 focus:shadow-none active:bg-blue-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
			                <i class="fa fa-sign-in" aria-hidden="true"></i>
			
			                Ingresar
			            </button>
			        </div>
			        
			    <input name="__RequestVerificationToken" type="hidden" value="CfDJ8PsupENnyaxJsSE9YBIZHT5KQT8kJrX3TIObg4_jQuDxNSek3DnldyWJLIrLG6t195oWUcNgFUdlJM0SZXn_Q1TwfZ73t0P6Yqv4kATn4hOnVSIMsoGxQHvpGFzKofgz3b3V-Sd-8ohH66hzI9rU2k0"><input name="Persist" type="hidden" value="false"></form>
			</section>
        	

        </main>
    

    <script src="/lib/jquery/dist/jquery.min.js"></script>

    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
    

<!-- Visual Studio Browser Link -->
<script type="text/javascript" src="/_vs/browserLink" async="async" id="__browserLink_initializationData" data-requestid="2f8998a884764702a38b28b8792bed9d" data-requestmappingfromserver="false" data-connecturl="http://localhost:54306/d44215c8dbef47c699c036401f907765/browserLink"></script>
<!-- End Browser Link -->
<script src="/_framework/aspnetcore-browser-refresh.js"></script>

</body></html>