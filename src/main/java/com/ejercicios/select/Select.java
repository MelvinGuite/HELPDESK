package com.ejercicios.select;

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
 * Servlet implementation class Select
 */
@WebServlet("/Select")
public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("registrar") != null ) {
			ArrayList<String> datos = new  ArrayList<>();
			datos.add(request.getParameter("nombre"));
			datos.add(request.getParameter("apellido"));
			datos.add(request.getParameter("email"));
			datos.add(request.getParameter("telefono"));
			datos.add(request.getParameter("edad"));
			datos.add(request.getParameter("ciudad"));
			datos.add(request.getParameter("pais"));
			datos.add(request.getParameter("comentarios"));
			datos.add(request.getParameter("genero"));
			datos.add(request.getParameter("interes"));
			
			try {
				Connmysql conn = new Connmysql();
				conn.RegistraDatos(datos);
				conn.cerrarConexion();
				System.out.println("Datos Registrados");
				request.setAttribute("registro", "Registrado con exito");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		try {
			ArrayList<String> listaDatos = new ArrayList<>();
			Connmysql conn = new Connmysql();
			ResultSet datos = conn.verDatos();
			while(datos.next()) {
				listaDatos.add(datos.getString("id_select"));
				listaDatos.add(datos.getString("nombre"));
				listaDatos.add(datos.getString("apellido"));
				listaDatos.add(datos.getString("correo"));
				listaDatos.add(datos.getString("telefono"));
				listaDatos.add(datos.getString("edad"));
				listaDatos.add(datos.getString("ciudad"));
				listaDatos.add(datos.getString("pais"));
				listaDatos.add(datos.getString("comentario"));
				listaDatos.add(datos.getString("genero"));
				listaDatos.add(datos.getString("interes"));
			}
			conn.cerrarConexion();
			if(listaDatos != null ) {
				 for (String ciclo : listaDatos) {
				    	System.out.println(ciclo);
				    }
			}
		   else {
		    	System.out.println("No hay datos");
		    }
		}catch(Exception e ) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("Select.jsp").forward(request, response);
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
