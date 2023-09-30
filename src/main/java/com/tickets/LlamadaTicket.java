package com.tickets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LlamadaTicket
 */
@WebServlet("/LlamadaTicket")
public class LlamadaTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String, String>> listaLlamada = new ArrayList<>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet ticket = conn.Ticket_llamada();
			while(ticket.next()) {
				Map<String, String> ticketinfo = new HashMap<>();
				ticketinfo.put("id_ticket", ticket.getString("id_ticket"));
				ticketinfo.put("area", ticket.getString("area"));
				listaLlamada.add(ticketinfo);
			}
			conn.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String data = new Gson().toJson(listaLlamada);
		PrintWriter out = response.getWriter();
		out.print(data);
		out.flush();
		System.out.println("LLamada de ticket");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
