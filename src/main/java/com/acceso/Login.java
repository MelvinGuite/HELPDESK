package com.acceso;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String correo = request.getParameter("email");
	    String pass = request.getParameter("user");
	    String identificacion = null;	    
	    try {
	        Connmysql conn = new Connmysql();
	        ResultSet rsIdentificacion = conn.Identificacion(correo, pass);
	        if (rsIdentificacion.next()) {
	        	identificacion = rsIdentificacion.getString("dpi_empleado");
				request.getSession().setAttribute("sesion",identificacion);
				response.sendRedirect("Menu.jsp");
	        } else {
	        	System.out.println("Error inicio");
	        	request.setAttribute("error", "Datos incorrectos");
	        	response.sendRedirect("index.jsp");
	        }
	        conn.cerrarConexion();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
    	request.getRequestDispatcher("index.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
