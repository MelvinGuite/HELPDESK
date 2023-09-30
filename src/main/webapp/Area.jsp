<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Áreas - Colegio de Ingenieros Agrónomos</title>
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
    margin-bottom: 10px;
  }
  button[type="submit"]:hover {
    background-color: #004d00; /* Verde más oscuro */
  }
  h2 {
    color: #006400; /* Verde oscuro */
    margin-top: 20px;
  }
  ul {
    list-style: none;
    padding: 0;
  }
  li {
    border-bottom: 1px solid #ccc;
    padding: 10px 0;
  }
</style>
</head>
<body>
<div class="container">
  <h1>Registro de Áreas</h1>
  <form action="RegistraArea" method="post">
    <label for="nombre_area">Nombre del Área:</label>
    <input type="text" name="nombre_area" id="nombre_area" placeholder="Ingrese el nombre del área">
    <button type="submit" name="registrar">Registrar Área</button>
    <button type="submit" name="ver">Ver Áreas existentes</button>
  </form>

  <%
    Object objareas = request.getAttribute("areas");
    List<String> areas = null;

    if (objareas instanceof List) {
      areas = (List<String>) objareas;
      if (areas != null) {
  %>

  <h2>Listado de Áreas</h2>
  <ul>
    <!-- El ciclo obtiene datos en paquetes de 2-->
    <%
      for(int i = 0; i < areas.size(); i += 2) {
        String id = areas.get(i);
        String nombre = areas.get(i + 1);
    %>
    <!-- Se muestran los datos en las filas de la lista -->
    <li><strong>ID:</strong> <%=id %> - <strong>Nombre:</strong> <%=nombre%></li>
    <%
      }
    %>
  </ul>
  <%
      }
    }
  %>
</div>
</body>
</html>
