package com.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bdd.ListeUtilisateurs;

/**
 * Servlet implementation class Gestion
 */
@WebServlet("/Gestion")
public class Gestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Gestion() {
    	super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("users", new ListeUtilisateurs().getResultat());
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/gestion.jsp");
		rd.forward(request, response);

	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
