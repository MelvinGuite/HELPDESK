package com.tickets;

import java.io.IOException;

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
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("acciones");
		String id_ticket = request.getParameter("ticket");
		String usuario = request.getParameter("usuario");
		String comentario = request.getParameter("comentario");
		String bt_llamar = request.getParameter("llamar");
		String bt_devolver = request.getParameter("devolver");
		
		System.out.println("Boton llamar al ticket " + bt_llamar);
		System.out.println("Se devuelve a lista el ticket " + bt_devolver);
		try {
			Connmysql conn = new Connmysql();
			
			if(request.getParameter("llamar") != null ) {
				System.out.println("LLamada de ticket " + bt_llamar);
				conn.llama_ticket(Integer.parseInt(bt_llamar));
				response.sendRedirect("AtencionTicket.jsp");
				conn.cerrarConexion();
			}
			
			if(request.getParameter("devolver") != null ) {
				System.out.println("Devolver a cola " + bt_devolver);
				conn.Retorna_ticket(Integer.parseInt(bt_devolver));
				response.sendRedirect("AtencionTicket.jsp");
				conn.cerrarConexion();
			}
				
			

			 if ("Atender".equals(accion)) {
				System.out.println("Atendiendo");
				conn.Atentiendo(Integer.parseInt(id_ticket), Integer.parseInt(usuario));
				response.getWriter().append("Servidor: ").append("Accion Procesada");
			}else if("Finalizar".equals(accion)) {
				System.out.println("Se finaliza");
				conn.FinalizaTicket(Integer.parseInt(id_ticket), comentario, Integer.parseInt(usuario));
				conn.cerrarConexion();
				response.sendRedirect("AtencionTicket.jsp");
			}else {
				System.out.println("No se ha recibido ninguna accion");
			}

			System.out.println("Numero del ticket a procesar" + bt_llamar);
			System.out.println("Numero del ticket a devolver" + bt_devolver);
			
		}catch(Exception e) {
			e.printStackTrace();
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
