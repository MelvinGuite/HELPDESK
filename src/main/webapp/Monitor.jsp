<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - Colegio de Ingenieros Agrónomos</title>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      background-color: #f0f7f4; /* Color verde suave de fondo */
      font-family: Arial, sans-serif;
    }

    h1 {
      background-color: #4caf50; /* Color verde suave para el encabezado */
      color: white;
      padding: 20px;
      text-align: center;
    }

    .table-container {
      display: flex;
      justify-content: space-between;
    }

    table {
      width: 30%; /* Ancho fijo para cada tabla */
      border-collapse: collapse;
      margin: 20px;
      background-color: white;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      max-height: 200px; /* Altura máxima para las tablas */
      overflow-y: auto; /* Agrega desbordamiento vertical si es necesario */
    }

    table caption {
      background-color: #4caf50; /* Color verde suave para el encabezado de la tabla */
      color: white;
      padding: 10px;
      font-weight: bold;
    }

    th, td {
      text-align: left;
      padding: 8px;
      border-bottom: 1px solid #ddd;
    }

    tr:hover {
      background-color: #f5f5f5;
    }
  </style>
</head>
<body>
  <h1>Dashboard - Tickets</h1>

  <div class="table-container">
    <table>
      <caption>Ticket en Espera</caption>
      <tr>
        <th>Número de Ticket</th>
        <th>Área</th>
        <th>Hora de Entrada</th>
      </tr>
      <tbody id="tablaespera">
        <!-- Contenido de la tabla de espera -->
      </tbody>
    </table>

    <table>
      <caption>Tickets en Llamado</caption>
      <tr>
        <th>Número de Ticket</th>
        <th>Área en Llamado</th>
      </tr>
      <tbody id="tablallamada">
        <!-- Contenido de la tabla de llamado -->
      </tbody>
    </table>

    <table>
      <caption>Tickets en Atención</caption>
      <tr>
        <th>Número de Ticket</th>
        <th>Área de Atención</th>
        
      </tr>
      <tbody id="cuerpoTabla">
        <!-- Contenido de la tabla de atención -->
      </tbody>
    </table>
  </div>




<script>
  function actualizarTabla2() {
    fetch('Atencion') // Reemplaza con la URL de tu servlet
      .then(response => response.json()) // Si tu servlet devuelve datos en formato JSON
      .then(data => {
        var cuerpoTabla = document.getElementById('cuerpoTabla');
        cuerpoTabla.innerHTML = ''; // Limpia el contenido actual

        data.forEach(ticket => {
          var fila = '<tr><td>' + ticket.numero + '</td><td>' + ticket.area + '</td></tr>';
          cuerpoTabla.insertAdjacentHTML('beforeend', fila);
        });
      })
      .catch(error => {
        console.error('Error al actualizar la tabla: ' + error.message);
      });
  }

  // Actualiza la tabla cada 3 segundos
  setInterval(actualizarTabla2, 3000);
</script>    
    
    
<script>
$(document).ready(function() {
  function actualizarTabla() {
    // Realizar una solicitud AJAX para obtener los datos del servidor
    $.ajax({
      url: 'Ticket_Espera', // Reemplaza 'tu_servlet_url' con la URL correcta de tu servlet
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        // Limpiar la tabla existente
        $('#tablaespera').empty();
        
        // Iterar sobre los datos y agregar filas a la tabla
        $.each(data, function(index, ticket) {
          var row = '<tr>' +
                    '<td>' + ticket.id_ticket + '</td>' +
                    '<td>' + ticket.area + '</td>' +
                    '<td>' + ticket.hora_min_seg + '</td>' +
                    '</tr>';
          $('#tablaespera').append(row);
        });
      },
      error: function() {
        console.error('Error al obtener datos del servidor.');
      }
    });
  }

  // Llamar a la función actualizarTabla cada 3 segundos
  setInterval(actualizarTabla, 3000);
});
</script>



<script>
function actualizarTabla3() {
	  fetch('LlamadaTicket') // Reemplaza con la URL de tu servlet
	    .then(response => response.json()) // Si tu servlet devuelve datos en formato JSON
	    .then(data => {
	      var cuerpoTabla = document.getElementById('tablallamada');
	      cuerpoTabla.innerHTML = ''; // Limpia el contenido actual

	      data.forEach(ticket => {
	        var fila = '<tr><td>' + ticket.id_ticket + '</td><td>' + ticket.area + '</td></tr>';
	        cuerpoTabla.insertAdjacentHTML('beforeend', fila);
	      });
	    })
	    .catch(error => {
	      console.error('Error al actualizar la tabla: ' + error.message);
	    });
	}

	// Actualiza la tabla cada 3 segundos
	setInterval(actualizarTabla3, 3000);

</script>    


</body>
</html>
