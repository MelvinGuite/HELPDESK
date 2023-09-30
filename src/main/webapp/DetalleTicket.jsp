<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin: 10px 0;
        }
        textarea {
            width: 60%;
            padding: 10px;
        }
        button {
            background-color: #5bc0be; /* Color de botón */
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px 0;
            cursor: pointer;
        }
        button:hover {
            background-color: #449b98; /* Color de botón al pasar el ratón */
        }
        select {
            padding: 10px;
            width: 100%;
            margin: 10px 0;
        }
    </style>
</head>
    <% String identificador = request.getParameter("id"); %>
    <% String identificacion = request.getParameter("usuario"); %>
<body>
    <h1>Detalle y solución de Ticket</h1>
     <h2>Ticket No: <%= identificador %></h2>
    <h2>Usuario: <%= identificacion %></h2>
    
<form id="frm_atender">
    <input name="ticket" id="ticket" value="<%= identificador %>">
    <input name="usuario" id="usuario" value="<%= identificacion %>">
    <button name="acciones" value="Atender" id="acciones" type="button" onclick="enviarFormulario()">Atender Ticket</button> <!-- Cambio el id y name -->
</form>
<div id="resultado"></div>

<script>
function enviarFormulario() {
  
    var ticket = encodeURIComponent(document.getElementById("ticket").value);
    var usuario = encodeURIComponent(document.getElementById("usuario").value);
    var atenderButtonValue = encodeURIComponent(document.getElementById("acciones").value);
    var url = "Estados?ticket=" + ticket + "&usuario=" + usuario + "&acciones=" + atenderButtonValue;

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            document.getElementById("resultado").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("POST", url, true);
    xmlhttp.send();
}
</script>

    
   <form action="Estados" method="get">
   	<input name="ticket" id="ticket" value="<%= identificador %>">
	<input name="usuario" id="usuario" value="<%= identificacion %>">
    <label>Detalles del solicitante</label>
    <textarea rows="5" cols="150" name="solicitante"></textarea>
    <label>Ingrese su comentario</label>
    <textarea rows="5" cols="15" name="comentario"></textarea><br>
    <button name="acciones" id="acciones" value="Finalizar">Finalizar</button>
   </form>
   

    
    <label>Indique area a trasladar ticket</label>
    <select name="area">
        <option value="Contabilidad">Contabilidad</option>
        <option value="Cobros">Cobros</option>
        <option value="Prestaciones">Prestaciones</option>
    </select>
        <label>Motivo de traslado</label>
    <textarea rows="5" cols="15" name="motivo_traslado"></textarea><br>
    
    <button name="traslado">Trasladar</button>
</body>
</html>
