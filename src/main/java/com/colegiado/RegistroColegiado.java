package com.colegiado;

import java.io.IOException;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistroColegiado
 */
@WebServlet("/RegistroColegiado")
public class RegistroColegiado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ArrayList<String> datos = new ArrayList<String>();
	datos.add(request.getParameter("id_colegiado"));
	datos.add(request.getParameter("nombre").toUpperCase());
	datos.add(request.getParameter("apellido").toUpperCase());
	datos.add(request.getParameter("edad"));
	datos.add(request.getParameter("estado_civil").toUpperCase());
	datos.add(request.getParameter("id_estado"));
	
	try {
		Connmysql conn = new Connmysql();
		conn.RegistraColegiado(datos);
		conn.cerrarConexion();
		request.setAttribute("mensaje", "Registro existoso");
	}catch (Exception e) {	
		e.printStackTrace();
	}
		request.getRequestDispatcher("RegistroColegiado.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
