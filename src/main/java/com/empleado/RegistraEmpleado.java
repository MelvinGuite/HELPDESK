package com.empleado;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistraEmpleado
 */
@WebServlet("/RegistraEmpleado")
public class RegistraEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	String identificacion = request.getParameter("dpi_empleado");
		
		if(request.getParameter("ver") != null ) {
			ArrayList<String> areas = new ArrayList<String>();
			ArrayList<String> roles = new ArrayList<String>();
			try {
				Connmysql conn = new Connmysql();
				ResultSet datos = conn.VerArea();
				while(datos.next()) {
					areas.add(datos.getString("id_area"));
					areas.add(datos.getString("nombre"));
					//2 columnas
				}
				ResultSet datos_rol = conn.VerRol();
				while(datos_rol.next()) {
					roles.add(datos_rol.getString("id_rol"));
					roles.add(datos_rol.getString("nombre"));
					//2 columnas
				}
				request.setAttribute("areas", areas);
				request.setAttribute("roles", roles);
				conn.cerrarConexion();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("registrar") != null ) {
			ArrayList<String> datos = new ArrayList<String>();
			datos.add(request.getParameter("dpi_empleado"));
			datos.add(request.getParameter("nombre").toUpperCase());
			datos.add(request.getParameter("apellido").toUpperCase());
			datos.add(request.getParameter("id_area"));
			datos.add(request.getParameter("id_rol"));
			try {
				Connmysql conn = new Connmysql();
				conn.RegistraEmpleado(datos);
				conn.cerrarConexion();
				request.setAttribute("mensaje", "Nuevo empleado registrado");
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		request.getRequestDispatcher("usuario.jsp").forward(request, response);
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
