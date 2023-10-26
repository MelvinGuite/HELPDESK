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


/**
 * Servlet implementation class Paginas
 */
@WebServlet("/Paginas")
public class Paginas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String identificacion = request.getParameter("identificacion");
		ArrayList<String> arrAcceso = new ArrayList<String>();
		System.out.println("Recibiedo solicitud de: " + identificacion);
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsAcceso = conn.Acceso(identificacion);
			while(rsAcceso.next()) {
				arrAcceso.add(rsAcceso.getString("pagina"));
				arrAcceso.add(rsAcceso.getString("contenido"));
			}
			conn.cerrarConexion();
			
			Gson gson = new Gson();
	        String json = gson.toJson(arrAcceso);
	        
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        response.getWriter().write(json);
	        System.out.println(json);
	        
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error en el servidor");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
