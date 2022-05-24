package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SupprimerAdmin
 */
@WebServlet("/SupprimerAdmin")
public class SupprimerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SupprimerAdmin() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/supprimerAdmin.jsp");
		dispatcher.forward(request, response);	
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String mail = request.getParameter("email");
					
			try {
				if(mail!=null) {

					Class.forName("org.mariadb.jdbc.Driver");
		            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
		            String query = "select id from utilisateurs where email=?";
		            
		            PreparedStatement pst = connexion.prepareStatement(query);
		            pst.setString(1, mail);
		            
		            ResultSet result = pst.executeQuery();					
					
		            if (result.next()) {
		            	String id = result.getString("id");
		            	PreparedStatement state = connexion.prepareStatement("DELETE FROM ligne where id='"+id+"'"); 
		            	state.executeQuery();	
		            	PreparedStatement state2 = connexion.prepareStatement("DELETE FROM utilisateurs where id='"+id+"'"); 
		            	state2.executeQuery();
		                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/suppressionReussie.jsp");
		        		dispatcher.forward(request, response);	
		        	}
		            else {
		            	request.setAttribute("error", "Identifiant ou mot de passe incorrect !");
		            	RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/supprimerAdmin.jsp");
		            	rq.include(request, response);
		            }
		          
				}
				
			} catch (Exception ex){
				out.println("Exception : "+ex.getMessage());
			}
		}	
	}

}
