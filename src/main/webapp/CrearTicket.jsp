<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Tickets - Colegio de Ingenieros Agrónomos</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }
  .container {
    background-color: #f0fff0; /* Verde suave */
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
  }
  h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #006400; /* Verde oscuro */
  }
  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #006400; /* Verde oscuro */
  }
  input[type="text"],
  input[type="number"],
  input[type="date"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 15px;
  }
  button[type="submit"] {
    display: block;
    width: 100%;
    background-color: #006400; /* Verde oscuro */
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px;
    cursor: pointer;
    transition: background-color 0.2s;
  }
  button[type="submit"]:hover {
    background-color: #004d00; /* Verde más oscuro */
  }
</style>
</head>
<body>
<div class="container">
  <h1>Registro de Tickets</h1>
  <form action="CrearTicket" method="get">

    <label for="id_colegiado">ID del Colegiado:</label>
    <input type="number" name="id_colegiado" id="id_colegiado" placeholder="Ingrese el ID del colegiado" >
<button type="submit" formnovalidate="formnovalidate" name="validar" id="validar">verificar identificacion</button>


<input name="numero_colegiado" value="${colegiado}" hidden="true">

<%
Object objColegiado = request.getAttribute("datos");
List <String> colegiado = null;
if(objColegiado instanceof List){
	colegiado = (List<String>) objColegiado;
	
	if(colegiado != null ){  
	
		for(int i = 0; i < colegiado.size(); i+= 2 ) {
		String nombre = colegiado.get(i);
		String apellido = colegiado.get(i + 1);  %>
	
		<input type="text" name="nombre" placeholder="Su nombre es:"  readonly="readonly" value="<%=nombre + " " + apellido%>" required="required">

<%		}
	%>	
		
<%	} %>
<%}
%>

    <label for="id_area">Área:</label>
 <%
 Object objAreas = request.getAttribute("areas");
 List<String> ListaAreas = null;
 
 if(objAreas instanceof List ) {
	 ListaAreas = (List<String>) objAreas;
	 
	 if(ListaAreas != null ){ %>
		 
		 <select name="area" required="required">
		  
	<%	 for (int i= 0; i<ListaAreas.size(); i += 2) {
		String id = ListaAreas.get(i);
		String nombre = ListaAreas.get(i + 1);
		%>
		<option value="<%=id%>"> <%=nombre %> </option>

		<%	} %>
	 </select>
	<%	 }  %>
<% }
 %>
	<label>Comentario</label>
	<textarea rows=10"" cols="53" placeholder="Ingrese su gestion" name="comentario" required="required"></textarea>

    <button type="submit" name="generar">Registrar Ticket</button>
  </form>
</div>
</body>
</html>
    