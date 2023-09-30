package com.acceso;

import java.io.IOException;
import java.sql.ResultSet;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String correo = request.getParameter("email");
	    String dpi = request.getParameter("user");
	    String pagina = "index.jsp";

	    try {
	        Connmysql conn = new Connmysql();

	        if (conn.Comprueba(Integer.parseInt(dpi), correo)) {
	            ResultSet rsDato = conn.login(Integer.parseInt(dpi), correo);
	            while (rsDato.next()) {
	                pagina = rsDato.getString("pagina");
	            }

	            // Obtener la sesión actual o crear una nueva si no existe
	            HttpSession session = request.getSession(true);

	            // Establecer una variable de sesión con la página
	            session.setAttribute("pagina", dpi);

	            response.sendRedirect(pagina);
	        } else {
	            response.sendRedirect("index.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    response.getWriter().append("Served at: ").append(request.getContextPath());
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
