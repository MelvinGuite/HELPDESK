 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

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
    

</head>
<body>

    <div id="contenedor_ticket">
<form action="CerrarSesion" method="get">

<button type="submit" name="cerrar">Cerrar sesion</button>
</form>
    <%-- Recuperar el valor de "pagina" de la sesión --%>
    <% HttpSession sssion = request.getSession(false); // Obtener la sesión sin crear una nueva %>
    <% String usuario = null; %>
    <% if (sssion != null) { %>
        <% usuario = (String) sssion.getAttribute("pagina"); %>
    <% } %>
 
    <%-- Utilizar el valor en la página JSP --%>
    <p>Usuario en Sesion: <%= usuario %></p>

<h1>Toma de Ticket</h1>

<script>
function actualizarTicket() {
    var xhttp = new XMLHttpRequest();
    var identificacion = "<%=usuario %>";
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            
            document.getElementById("contenedor_ticket").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "AtencionTicket?identificacion=" + identificacion, true);
    xhttp.send();
}
setInterval(actualizarTicket, 5000);
  window.onload = actualizarTicket;
</script>


<script>
document.addEventListener("DOMContentLoaded", function() {
    var formulario = document.getElementById("miFormulario");
    
    formulario.addEventListener("submit", function(event) {
        event.preventDefault(); // Evita el envío normal del formulario

        // Crea una instancia de XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Configura la solicitud
        xhr.open("POST", formulario.getAttribute("action"), true);

        // Configura la función de respuesta
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Aquí puedes manejar la respuesta del servidor si es necesario
                console.log(xhr.responseText);
            }
        };


        var formData = new FormData(formulario);

        // Envía la solicitud
        xhr.send(formData);
    });
});
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <form id="miFormulario" method="post" action="Estados">
<table>
    <caption>Tickets en Cola</caption>
    <tr>
        <th>No. De Ticket</th>
        <th>Llamar Ticket</th>
        <th colspan="1">Acciones</th>
        <th>Estado</th>
    </tr>

    <%
        Object objTicket = request.getAttribute("lsTicket");
        List<String> lsTicket = null;
        if (objTicket instanceof List) {
            lsTicket = (List<String>) objTicket;
        
        if (lsTicket != null) {
            for (int i = 0; i < lsTicket.size(); i += 6) {
                String id = lsTicket.get(i);
                String nombre = lsTicket.get(i + 1);
                String dpi = lsTicket.get(i + 2);
                String empleado_nombre = lsTicket.get(i + 3);
                String empleado_apellido = lsTicket.get(i + 4);
                String estado = lsTicket.get(i + 5);
    %>

 
    <tr>
        <td><input value="<%= id %>" name="ticket" ></td>
        
        <td><a href="DetalleTicket.jsp?id=<%=id%>&usuario=<%=usuario%>" target="_blank">Ir a detalles</a></td>
        
        <td>Estado Actual: <%=estado%></td>
<td>
<button id="llamar" name="llamar" type="submit" value="<%= id %>" >Llamar Ticket</button>
</td>

<td>
<button id="devolver" name="devolver" type="submit" value="<%= id %>" >Devolver a cola</button>
</td>
    </tr>
    <%
            }
        }
        }
    %>
</table>
</form>

</div>

</body>
</html>
