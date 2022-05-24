package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class ModifierDroits
 */
@WebServlet("/ModifierDroits")
public class ModifierDroits extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ModifierDroits() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/modifierDroits.jsp");
		dispatcher.forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try(PrintWriter out = response.getWriter()){
			String mail = request.getParameter("email");
			String statut = request.getParameter("statut");
					
			try {
				if(mail!=null) {

					Class.forName("org.mariadb.jdbc.Driver");
		            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");		            
		            PreparedStatement pst = connexion.prepareStatement("UPDATE utilisateurs SET statut=? WHERE email=?");
		            pst.setString(1, statut);
		            pst.setString(2, mail);
	
		            pst.executeQuery();					

	            	RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/droitsReussis.jsp");
	            	rq.include(request, response);
		            
				}
            		          
				
			} catch (Exception ex){
				out.println("Exception : "+ex.getMessage());
			}
		}
	}

}
