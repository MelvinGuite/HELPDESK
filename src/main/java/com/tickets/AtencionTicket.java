package com.tickets;

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
 * Servlet implementation class AtencionTicket
 */
@WebServlet("/AtencionTicket")
public class AtencionTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String identificacion = request.getParameter("identificacion");
		if(identificacion != null && !identificacion.isEmpty() && !identificacion.isBlank()  ) {
			ArrayList<String> arrTicket = new ArrayList<>();
			try {
				Connmysql conn = new Connmysql();
				ResultSet rsTicket = conn.ticket_Area(Integer.parseInt(identificacion));
				while(rsTicket.next()) {
					arrTicket.add(rsTicket.getString("id_ticket"));
					arrTicket.add(rsTicket.getString("nombre"));
					arrTicket.add(rsTicket.getString("dpi_empleado"));
					arrTicket.add(rsTicket.getString("empleado"));
					arrTicket.add(rsTicket.getString("apellido"));
					arrTicket.add(rsTicket.getString("estado"));
				}
				conn.cerrarConexion();
				request.setAttribute("lsTicket", arrTicket);
				 System.out.println("despliegue automatico de ticket");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("no se ha recibido la identificacion");
		}
		
		request.getRequestDispatcher("AtencionTicket.jsp").forward(request, response);
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
