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
 * Servlet implementation class Atencion
 */
@WebServlet("/Atencion")
public class Atencion extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<Map<String, String>> atendiendoList = new ArrayList<>();

	    try {
	        Connmysql conn = new Connmysql();
	        ResultSet ticket = conn.Ticket_atendiendo();
	        
	        while (ticket.next()) {
	            Map<String, String> ticketInfo = new HashMap<>();
	            ticketInfo.put("numero", ticket.getString("id_ticket"));
	            ticketInfo.put("area", ticket.getString("area"));
	            atendiendoList.add(ticketInfo);
	        }

	        conn.cerrarConexion();
	        System.out.print("despliegue automatico de ticket");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // Configura la respuesta como JSON
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // Convierte la lista de datos a JSON
	    String jsonData = new Gson().toJson(atendiendoList);

	    // Escribe la respuesta JSON en el cuerpo de la respuesta
	    PrintWriter out = response.getWriter();
	    out.print(jsonData);
	    out.flush();
	    
	    System.out.println("Atencion");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
