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
 * Servlet implementation class NuevoTicket
 */
@WebServlet("/NuevoTicket")
public class NuevoTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("validar") != null ) {
			ArrayList<String> ListaDatos = new ArrayList<String>();
			ArrayList<String> ListaAreas = new ArrayList<String>();
			String colegiado = request.getParameter("id_colegiado");
			request.setAttribute("colegiado", colegiado);
			try {
				Connmysql conn = new Connmysql();
				ResultSet datos = conn.nombre_colegiado(Integer.parseInt(colegiado));
				while(datos.next()) {
					ListaDatos.add(datos.getString("nombre"));
					ListaDatos.add(datos.getString("apellido"));
				}
				request.setAttribute("datos", ListaDatos);
				
				ResultSet areas = conn.VerArea();
				while(areas.next()) {
					ListaAreas.add(areas.getString("id_area"));
					ListaAreas.add(areas.getString("nombre"));
				}
				
				request.setAttribute("areas", ListaAreas);
				conn.cerrarConexion();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("generar") != null ) {
			ArrayList<String> Lista = new ArrayList<String>();
			Lista.add(request.getParameter("comentario"));
			Lista.add(request.getParameter("numero_colegiado"));
			Lista.add(request.getParameter("area"));
			
			try {
				Connmysql conn = new Connmysql();
				int numeo = conn.GeneraTicket(Lista);
				System.out.println("Se genero el numero " + numeo);
				conn.cerrarConexion();
				request.setAttribute("ticket", numeo);
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("NO se genero el numero");
			}
		}
		
		
		
		request.getRequestDispatcher("CrearTicket.jsp").forward(request, response);
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


