<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Colegiados - Colegio de Ingenieros Agrónomos</title>
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
  input[type="number"] {
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
<h1>${mensaje}</h1>
  <h1>Registro de Colegiados</h1>
  <form action="RegistroColegiado" method="post">
  
    <label for="id_colegiado">Identificacion de colegiado:</label>
    <input type="text" name="id_colegiado" id="id_colegiado" placeholder="Registre su identificacion" required>
    
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" placeholder="Ingrese el nombre" required>

    <label for="apellido">Apellido:</label>
    <input type="text" name="apellido" id="apellido" placeholder="Ingrese el apellido" required>

    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad" placeholder="Ingrese la edad">

    <label for="estado_civil">Estado Civil:</label>
    <select name="estado_civil">
    <option value="Soltero(a)">Soltero(a)</option>
    <option value="Casado(a)">Casado(a)</option>
    <option value="Viudo(a)">Viudo(a)</option>
    </select>
<br><br>
    <label for="id_estado">Estado:</label>
    <select name="id_estado">
    <option value="1">Activo</option>
    <option value="2">Inactivo</option>
    </select> <br> <br> 
    <button type="submit">Registrar Colegiado</button>
  </form>
</div>
</body>
</html>
