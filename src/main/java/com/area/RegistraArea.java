package com.area;

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
 * Servlet implementation class RegistraArea
 */
@WebServlet("/RegistraArea")
public class RegistraArea extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("registrar") != null ) {
			String nombre_area;
			if(request.getParameter("nombre_area") != null ) {
			 nombre_area = request.getParameter("nombre_area").toUpperCase();
			}else {
				nombre_area = "";
			}
			try {
				Connmysql conn = new Connmysql();
				conn.RegistraArea(nombre_area);
				conn.cerrarConexion();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("ver") != null ) {
			ArrayList<String> areas = new ArrayList<String>();
			try {
				Connmysql conn = new Connmysql();
				ResultSet datos = conn.VerArea();
				while(datos.next()) {
					areas.add(datos.getString("id_area"));
					areas.add(datos.getString("nombre"));
					//2 columnas
				}
				request.setAttribute("areas", areas);
				conn.cerrarConexion();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("Area.jsp").forward(request, response);
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
