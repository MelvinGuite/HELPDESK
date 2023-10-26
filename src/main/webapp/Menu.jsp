<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mostrar Datos JSON en JSP</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
  <style>
    /* Estilos generales */
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    /* Estilos para el contenedor principal */
    .container {
      display: flex;
      height: 100vh;
    }

    /* Estilos para el men� lateral */
    .sidebar {
      width: 250px;
      background-color: #333;
      color: #fff;
      padding: 20px;
    }

    .sidebar h2 {
      margin-top: 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #fff;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
      margin: 20px 0;
    }

    .sidebar ul li {
      margin-bottom: 10px;
    }

    .sidebar ul li a {
      color: #fff;
      text-decoration: none;
    }

    /* Estilos para el contenido principal */
    .main-content {
      flex: 1;
      padding: 0;
    }

    .main-content iframe {
      width: 100%;
      height: 100%;
      border: none;
    }

    /* Media queries para la responsividad */
    @media screen and (max-width: 768px) {
      .container {
        flex-direction: column;
      }

      .sidebar {
        width: 100%;
        padding: 10px;
      }

      .sidebar h2 {
        text-align: center;
      }

      .main-content {
        flex: 1;
      }
    }
  </style>
</head>
    <%
String usuario = (String) request.getSession().getAttribute("sesion");
if (usuario == null) {
	usuario = "No ha iniciado sesion";
	response.sendRedirect("index.jsp");
}
%>
<body>
<div class="container">
  <div class="sidebar" id="sidebar">
    <h2>Menu</h2>
    <p>En linea: <%=usuario%></p>
    <ul></ul> <!-- Aquí se agregarán los enlaces dinámicamente -->
    <li><a href="#" id="cerrar-sesion">Cerrar Sesión</a></li>  </div>
  <div class="main-content" id="main-content">
    <iframe name="content" src=""></iframe>
  </div>
</div>
 
  
  
<script type="text/template" id="enlace-template">
  <li><a href="{pagina}" target="content">{contenido}</a></li>
</script>



    
  <script>
  $(document).ready(function () {
	    $.ajax({
	        url: 'Paginas', 
	        type: 'get',
	        data: { identificacion: '<%=usuario%>' },
	        dataType: 'json',
	        success: function (data) {
	            // Obtén el template
	            var enlaceTemplate = $('#enlace-template').html();
	            
	            // Vacía la lista existente
	            $('#sidebar ul').empty();

	            for (var i = 0; i < data.length; i += 2) {
	                var pagina = data[i];
	                var contenido = data[i + 1];

	                // Reemplaza los marcadores en el template con los valores actuales
	                var enlaceHTML = enlaceTemplate.replace('{pagina}', pagina).replace('{contenido}', contenido);

	                // Agrega el enlace generado a la lista
	                $('#sidebar ul').append(enlaceHTML);
	            }

	            // Agrega un controlador de eventos para el botón "Cerrar Sesión"
	            $('#cerrar-sesion').click(function(e) {
	                e.preventDefault();
	                $.ajax({
	                    url: 'CerrarSesion',  // Ruta al servlet de cierre de sesión
	                    type: 'get',  // Puede ser 'post' si prefieres
	                    success: function (response) {
	                        // Realiza alguna acción después de cerrar sesión, como redirigir a la página de inicio de sesión, por ejemplo.
	                        window.location.href = 'index.jsp';
	                    },
	                    error: function () {
	                        console.log('Error en la solicitud AJAX para cerrar sesión');
	                    }
	                });
	            });
	        },
	        error: function () {
	            console.log('Error en la solicitud AJAX');
	        }
	    });
	});
</script>
</body>
</html>
