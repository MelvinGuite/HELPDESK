<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Empleados - Colegio de Ingenieros Agrónomos</title>
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
  input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 15px;
  }
  select {
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
<h2>${mensaje}</h2> <br>
<div class="container">
  <h1>Registro de Empleados</h1>
  <form action="RegistraEmpleado" method="get">
  
      <button type="submit" formnovalidate="formnovalidate" name="ver" id="ver"> Ver roles y areas disponibles</button>
        
    <label for="dpi_empleado">DPI del Empleado:</label>
    <input type="text" name="dpi_empleado" id="dpi_empleado" placeholder="Ingrese el DPI del empleado" required>

    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" placeholder="Ingrese el nombre" required>

    <label for="apellido">Apellido:</label>
    <input type="text" name="apellido" id="apellido" placeholder="Ingrese el apellido" required>

    <label for="id_rol">Seleccione un Rol:</label>

     <%
    Object objroles = request.getAttribute("roles");
    List<String> roles = null;

    if (objroles instanceof List) {
      roles = (List<String>) objroles;
      if (roles != null) {
  %>

  <select name="id_rol">
    <%
      for(int i = 0; i < roles.size(); i += 2) {
        String id = roles.get(i);
        String nombre_rol = roles.get(i + 1);
    %>
    <option value="<%=id %>"><%=nombre_rol%></option>
    <%
      }
    %>
</select>
  <%
      }
    }
  %>
    
    
<label for="id_rol">Asigne un Area:</label>
  <%
    Object objareas = request.getAttribute("areas");
    List<String> areas = null;

    if (objareas instanceof List) {
      areas = (List<String>) objareas;
      if (areas != null) {
  %>
  <select name="id_area" required="required"> 
    <!-- El ciclo obtiene datos en paquetes de 2-->
    <%
      for(int i = 0; i < areas.size(); i += 2) {
        String id = areas.get(i);
        String nombre = areas.get(i + 1);
    %>
    <option value="<%=id %>"><%=nombre%></option>

    <%
      }
    %>
</select>
  <%
      }
    }
  %>

    <button type="submit" name="registrar" id="registrar">Registrar Empleado</button>
  </form>
</div>

</body>
</html>
