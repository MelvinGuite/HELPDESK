package com.tickets;

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
 * Servlet implementation class HistorialTicket
 */
@WebServlet("/HistorialTicket")
public class HistorialTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario");
		ArrayList<String> arrTicket = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsTicket = conn.HistorialTicket(usuario);
			while(rsTicket.next()) {
				arrTicket.add(rsTicket.getString("id_ticket"));
				arrTicket.add(rsTicket.getString("fecha_cierre"));
				arrTicket.add(rsTicket.getString("comentario_empleado"));
			}
			conn.cerrarConexion();
			
			Gson gson = new Gson();
			String json = gson.toJson(arrTicket);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			
			response.getWriter().write(json);
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Ha ocurrido un error en el servidor");
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
