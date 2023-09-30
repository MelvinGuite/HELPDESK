<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Responsivo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212; /* Fondo oscuro */
            color: #fff; /* Texto blanco */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #333; /* Fondo del contenedor */
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            border-radius: 5px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #fff;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #555; /* Borde gris */
            border-radius: 4px;
            background-color: #444; /* Fondo del campo de entrada */
            color: #fff; /* Texto blanco */
        }

        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 5px;
        }

        button[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <h1>${registro}</h1>
    <div class="container">
        <h1>Formulario de Contacto</h1>
        <form action="Select" method="get">
            <div class="input-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>

            <div class="input-group">
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
            </div>

            <div class="input-group">
                <label for="email">Correo Electronico:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="input-group">
                <label for="telefono">Telefono:</label>
                <input type="tel" id="telefono" name="telefono">
            </div>

            <div class="input-group">
                <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" required>
            </div>

            <div class="input-group">
                <label for="ciudad">Ciudad:</label>
                <input type="text" id="ciudad" name="ciudad">
            </div>

            <div class="input-group">
                <label for="pais">Pais:</label>
                <input type="text" id="pais" name="pais">
            </div>

            <div class="input-group">
                <label for="comentarios">Comentarios:</label>
                <textarea id="comentarios" name="comentarios" rows="4"></textarea>
            </div>

            <div class="input-group">
                <select name="genero" id="genero">
                <option>Masculino</option>
                <option>Femenino</option>
                </select>
            </div>

            <div class="input-group">
            <select name="interes" id="interes">
            <option value="Musica">Musica</option>
            <option value="Deportes">Deporte</option>
            <option Value="Viajar">Viaje</option>
            </select>
            </div>
            <div class="input-group">
                <button type="submit" name="registrar">Registrar</button>
                <button type="submit" name="Ver" formnovalidate="formnovalidate">datos en LOG</button>
            </div>
        </form>
    </div>
</body>
</html>