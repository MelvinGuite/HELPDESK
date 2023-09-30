package com.rol;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistraRol
 */
@WebServlet("/RegistraRol")
public class RegistraRol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("registrar") != null ) {
			String nombre_rol;
			if(request.getParameter("nombre_rol") != null ) {
			 nombre_rol = request.getParameter("nombre_rol").toUpperCase();
			}else {
				nombre_rol = "";
			}
			try {
				Connmysql conn = new Connmysql();
				conn.RegistraRol(nombre_rol);
				conn.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("ver") != null ) {
			ArrayList<String> roles = new ArrayList<String>();
			try {
				Connmysql conn = new Connmysql();
				ResultSet datos = conn.VerRol();
				while(datos.next()) {
					roles.add(datos.getString("id_rol"));
					roles.add(datos.getString("nombre"));
					//2 columnas
				}
				request.setAttribute("roles", roles);
				conn.cerrarConexion();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("Rol.jsp").forward(request, response);
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
