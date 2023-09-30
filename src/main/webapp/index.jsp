 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="estilo.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" type="text/css" href="ruta/estilo.css">
<body>
<h1>${error}</h1>
<div class="login">
	<h1>Login</h1>
    <form method="post" action="Login">
    	 <input type="email" class="login-username" name="email" autofocus="true" required="true" placeholder="Email" />
  <input type="password" class="login-password" name="user" required="true" placeholder="Password" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
    </form>
</div>
<div>

</div>
</body>
</html>