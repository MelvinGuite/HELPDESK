package com.tickets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Prueba_Boton
 */
@WebServlet("/Prueba_Boton")
public class Prueba_Boton extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ticket = request.getParameter("ticket");
		String usuario = request.getParameter("usuario");
		String campo = request.getParameter("accion");
		String boton = request.getParameter("atenderButton");
		System.out.println("el campo es" + campo);
		System.out.println("El boton dice: " + boton);
		System.out.println("El ticket es: " + ticket);
		System.out.println("El usuario es: " + usuario);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String ticket = request.getParameter("ticket");
	    String usuario = request.getParameter("usuario");
	    String campo = request.getParameter("accion");
	    String boton = request.getParameter("atenderButton");
	    System.out.println("El campo es: " + campo);
	    System.out.println("El boton dice: " + boton);
	    System.out.println("El ticket es: " + ticket);
	    System.out.println("El usuario es: " + usuario);
	    
	    // Aquí puedes agregar la lógica para procesar los datos del formulario y responder adecuadamente.
	    
	    response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
