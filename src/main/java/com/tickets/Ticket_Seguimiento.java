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
 * Servlet implementation class Ticket_Seguimiento
 */
@WebServlet("/Ticket_Seguimiento")
public class Ticket_Seguimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String identificacion = request.getParameter("identificacion");
		String area = null;
		ArrayList<String> arrSeguimiento = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsArea = conn.Area(Integer.parseInt(identificacion));
			if(rsArea.next()) {
				area = rsArea.getString("id_area");
				
				ResultSet rsSeguimiento = conn.TicketSeguimiento(area);
				while (rsSeguimiento.next()) {
					arrSeguimiento.add((rsSeguimiento.getString("id_ticket")));
					arrSeguimiento.add((rsSeguimiento.getString("usuario_traslada")));
					arrSeguimiento.add((rsSeguimiento.getString("comentario_traslado")));
					arrSeguimiento.add((rsSeguimiento.getString("area_traslada")));
					arrSeguimiento.add((rsSeguimiento.getString("estado")));
				}
				
				Gson gson = new Gson();
				String json = gson.toJson(arrSeguimiento);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				response.getWriter().write(json);
				System.out.println(json);
			}
			
			
			conn.cerrarConexion();
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error en el servidor");
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
