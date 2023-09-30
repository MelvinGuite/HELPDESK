package com.tickets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ticket_Espera
 */
@WebServlet("/Ticket_Espera")
public class Ticket_Espera extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    ArrayList<Map<String, String>> listaEspera = new ArrayList<>();
	    try {
	        Connmysql conn = new Connmysql();
	        ResultSet ticket = conn.Ticket_espera();
	        while (ticket.next()) {
	            Map<String, String> ticketData = new HashMap<>();
	            ticketData.put("id_ticket", ticket.getString("id_ticket"));
	            ticketData.put("area", ticket.getString("area"));
	            ticketData.put("hora_min_seg", ticket.getString("hora_min_seg"));
	            listaEspera.add(ticketData);
	        }

	        conn.cerrarConexion();
	        System.out.println("En espera");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    String jsondata = new Gson().toJson(listaEspera);

	    PrintWriter out = response.getWriter();
	    out.print(jsondata);
	    out.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
