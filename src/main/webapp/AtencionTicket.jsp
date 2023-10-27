 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Asignación de Ticket</title>
<style>
body {
            font-family: Arial, sans-serif;
            background-color: #f0f8f7; /* Verde suave pastel */
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #5bc0be; /* Color de encabezado */
            color: white;
            padding: 20px;
            margin: 0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #5bc0be; /* Color de encabezado de tabla */
            color: white;
        }
        button {
            background-color: #5bc0be; /* Color de botón */
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        button:hover {
            background-color: #449b98; /* Color de botón al pasar el ratón */
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="text"] {
            padding: 5px;
        }
        

  </style>
    
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>



</head>
    <%
String usuario = (String) request.getSession().getAttribute("sesion");
if (usuario == null) {
	
	%>
	<script type="text/javascript">
	    window.close();
	</script>
	<%
	}
	%>
<body>



  <h1>Toma de Ticket en espera</h1>
    <table id="ticket" >
        <thead>
            <tr>
                <th>No. De Ticket</th>
                <th>Estado</th>
                <th>Detalles</th>
                <th>Accion</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí se insertarán las filas de datos -->
        </tbody>
    </table>


<h1>Ticket Trasladados</h1>
<table id="ticket_seguimiento">
    <thead>
        <tr>
            <th>No. De Ticket</th>
            <th>Empleado que traslada</th>
            <th>Motivo</th>
            <th>Area que traslada</th>
            <th>Estado</th>
            <th>Detalle</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>

<script type="text/javascript">
    $(document).ready(function () {
        var identificacion = "<%=usuario%>";

       
        setInterval(function () {
            Tickets();
        }, 1000);

        function Tickets() {
            $.ajax({
                url: 'Ticket_Seguimiento',
                type: 'get',
                dataType: 'json',
                data: { identificacion: identificacion },
                success: function (data) {
                    var tabla = $('#ticket_seguimiento').find('tbody');
                    tabla.empty();

                    for (var i = 0; i < data.length; i += 5) {
                        var id_ticket = data[i];
                        var usuario = data[i + 1];
                        var comentario = data[i + 2];
                        var area = data[i + 3];
                        var estado = data[i + 4];

                        var row = $('<tr>');
                        row.append($('<td>').text(id_ticket));
                        row.append($('<td>').text(usuario));
                        row.append($('<td>').text(comentario));
                        row.append($('<td>').text(area));
                        row.append($('<td>').text(estado));
                        row.append($('<td>').html('<a href="DetalleTicket.jsp?id=' + id_ticket + '">Ver Detalles</a>'));

                        tabla.append(row); // Agrega la fila a la tabla
                    }
                },
                error: function () {
                    console.log('Error en la solicitud');
                }
            });
        }
    });
</script>
















<script type="text/javascript">
$(document).ready(function () {
    var identificacion = "<%=usuario%>";
    var llamadaActual = false; // Variable para rastrear el estado de la llamada actual del usuario

    // Llama a la función cada 3 segundos
    setInterval(function () {
        cargarTickets();
    }, 1000);

    function cargarTickets() {
        $.ajax({
            url: 'AtencionTicket',
            type: 'get',
            dataType: 'json',
            data: { identificacion: identificacion },
            success: function (data) {
                var tabla = $('#ticket').find('tbody');
                tabla.empty();

                for (var i = 0; i < data.length; i += 2) {
                    var id_ticket = data[i];
                    var estado = data[i + 1];

                    var row = $('<tr>');
                    row.append($('<td>').text(id_ticket));
                    row.append($('<td>').text(estado));
                    row.append($('<td>').html('<a href="DetalleTicket.jsp?id=' + id_ticket + '">Ver Detalles</a>'));

                    var acciones = $('<td>');
                    var llamarButton = $('<button>').text('Llamar');
                    var devolverButton = $('<button>').text('Devolver');

                    

                    llamarButton.click(function (id, accion) {
                        return function () {
                            realizarAccion(accion, id);
                            // Deshabilita el botón después de hacer clic y marca la llamada actual
                            llamadaActual = true;
                            llamarButton.prop('disabled', true);
                        };
                    }(id_ticket, 'llamar'));

                    devolverButton.click(function (id, accion) {
                        return function () {
                            realizarAccion(accion, id);
                            // Habilita el botón "Llamar" al devolver la llamada
                            llamadaActual = false;
                            llamarButton.prop('disabled', false);
                        };
                    }(id_ticket, 'devolver'));

                    acciones.append(llamarButton);
                    acciones.append(devolverButton);

                    row.append(acciones);
                    tabla.append(row);
                }
            },
            error: function () {
                console.log('Error en la solicitud');
            }
        });
    }

    function realizarAccion(accion, id_ticket) {
        console.log(accion);
        $.ajax({
            url: 'Estados',
            type: 'post',
            data: {
                acciones: accion,
                ticket: id_ticket
            },
            success: function (response) {
                // Procesa la respuesta del servidor si es necesario
            },
            error: function () {
                console.log('Error en la solicitud al servlet');
            }
        });
    }
});
</script>



</body>
</html>
