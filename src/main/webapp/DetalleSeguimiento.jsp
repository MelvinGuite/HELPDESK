<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle seguimiento</title>
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
	
	<%
String identificador = request.getParameter("id");
%>
<body>

<h1>Ticket No:<%=identificador%></h1>


<a href="AtencionTicket.jsp">Regresar</a>
	<form action="Estados" method="get">
		<label>Indique la finalizacion del Ticket</label> 
		<textarea rows="5" cols="15" name="Comentario_Finaliza" id="Comentario_Finaliza"></textarea>
		<input name="ticket" id="ticket" value="<%=identificador%>" hidden="true">
		<input name="usuario" id="usuario" value="<%=usuario%>" hidden="true"> 
		<br>
		<button name="acciones" id="acciones" value="Finalizar_Traslado">Guardar</button>
	</form>
	
	
<h2>¿El ticket se esta siendo atendido?</h2>
<label>Cambia el estado a "Atendiendo"</label> 
	<form action="Estados" method="get">
		<input name="ticket" id="ticket" value="<%=identificador%>" hidden="true">
		<input name="usuario" id="usuario" value="<%=usuario%>" hidden="true"> 
	    <textarea rows="5" cols="15" name="atendiendo" id="atendiendo"></textarea>
		<button name="acciones" id="acciones" value="Atender_Traslado">Atendiendo</button>
	</form>
</body>
</html>



