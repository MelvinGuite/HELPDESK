<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Atendidos</title>
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
<h1>Ticket atendidos</h1>
    <table id="ticket_atendidos" >
        <thead>
            <tr>
                <th>No. De Ticket</th>
                <th>Fecha</th>
                <th>Comentario</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>

    <script type="text/javascript">
        $(document).ready(function () {
            var identificacion = "<%=usuario%>";

            function Atendidos() {
                $.ajax({
                    url: 'HistorialTicket',
                    type: 'get',
                    dataType: 'json',
                    data: { usuario: identificacion },
                    success: function (data) {
                        var tabla = $('#ticket_atendidos').find('tbody');
                        tabla.empty();

                        for (var i = 0; i < data.length; i += 3) {
                            var id_ticket = data[i];
                            var fecha = data[i + 1];
                            var comentario = data[i + 2];

                            var row = $('<tr>');
                            row.append($('<td>').text(id_ticket));
                            row.append($('<td>').text(fecha));
                            row.append($('<td>').text(comentario));

                            tabla.append(row);
                        }
                        // Inicializar DataTables
                        $('#ticket_atendidos').DataTable();
                    },
                    error: function () {
                        console.log('Error en la solicitud');
                    }
                });
            }

            Atendidos();
        });
    </script>

</body>
</html>























