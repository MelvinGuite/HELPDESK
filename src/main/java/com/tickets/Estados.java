package com.tickets;

import java.io.IOException;
import java.sql.ResultSet;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Estados
 */
@WebServlet("/Estados")
public class Estados extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("acciones");
	    String id_ticket = request.getParameter("ticket");
		String usuario = request.getParameter("usuario");
		String comentario = request.getParameter("comentario");

        System.out.println("Acción: " + accion);
        System.out.println("ID del ticket: " + id_ticket);
		try {
			Connmysql conn = new Connmysql();

			if("llamar".equals(accion)){
				System.out.println("LLamada de ticket " + id_ticket);
				conn.llama_ticket(Integer.parseInt(id_ticket));
				conn.cerrarConexion();
			}
			
			if("devolver".equals(accion)){
				System.out.println("Devolver a cola " + id_ticket);
				conn.Retorna_ticket(Integer.parseInt(id_ticket));
				conn.cerrarConexion();
			}
				
			if ("Atender".equals(accion)) {
				System.out.println("Atendiendo");
				conn.Atentiendo(Integer.parseInt(id_ticket), Integer.parseInt(usuario));

				ResultSet rsComentario = conn.comentario(Integer.parseInt(id_ticket));
				String stComentario = null;
				while (rsComentario.next()) {
					stComentario = rsComentario.getString("comentario_usario");
				}
				System.out.println("El comentario es:" + stComentario);
				request.setAttribute("comentario_colegiado", stComentario);
				conn.cerrarConexion();
				response.getWriter().append("El colegiado indica: ").append(stComentario);
			} else if ("Finalizar".equals(accion)) {
				System.out.println("Se finaliza");
				conn.FinalizaTicket(Integer.parseInt(id_ticket), comentario, Integer.parseInt(usuario));
				conn.cerrarConexion();
				response.sendRedirect("AtencionTicket.jsp");
			} else if ("Traslado".equals(accion)) {
				System.out.println("Se traslada Ticket");
				response.sendRedirect("AtencionTicket.jsp");
			} else {
				System.out.println("No se ha recibido ninguna accion");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
