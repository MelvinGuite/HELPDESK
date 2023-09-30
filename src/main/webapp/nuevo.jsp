<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ejemplo de Formulario con Campos Adicionales</title>
</head>
<body>
    <form id="miFormulario">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" placeholder="Tu nombre">

        <label for="email">Correo electrónico:</label>
        <input type="email" name="email" id="email" placeholder="tu@email.com">

        <label for="pais">País:</label>
        <select name="pais" id="pais">
            <option value="usa">Estados Unidos</option>
            <option value="canada">Canadá</option>
            <option value="mexico">México</option>
            <!-- Agrega más opciones de país aquí -->
        </select>

        <label>Género:</label>
        <input type="radio" name="genero" value="masculino" id="masculino">
        <label for="masculino">Masculino</label>
        <input type="radio" name="genero" value="femenino" id="femenino">
        <label for="femenino">Femenino</label>

        <input type="button" value="Enviar" onclick="enviarFormulario()">
    </form>
    <div id="resultado"></div>

    <script>
        function enviarFormulario() {
            var formulario = document.getElementById("miFormulario");
            var formData = new FormData(formulario);

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    document.getElementById("resultado").innerHTML = xmlhttp.responseText;
                }
            };
            xmlhttp.open("GET", "Estados", true);
            
            xmlhttp.send(formData);
        }
    </script>
</body>
</html>

