<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="NuevoTicket" method="get">

<input type="text" name="numero_colegiado" id="numero_colegiado">


<input type="text" name="area" id="area">


	<textarea rows="10" cols="53" placeholder="Ingrese su gestion" name="comentario" required="required"></textarea>


    <button type="submit" name="generar" id="generar">Registrar Ticket</button>
  </form>
</body>
</html>