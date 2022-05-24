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
import javax.servlet.http.HttpSession;


@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Contact() {
        super();
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/contact.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String sexe = request.getParameter("sexe");
					
			try {
				if(email!=null) {
					Class.forName("org.mariadb.jdbc.Driver");
		            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
		            String query = "select * from utilisateurs where email='"+email+"'";
		            
		            PreparedStatement pst = connexion.prepareStatement(query);
	
		            ResultSet result = pst.executeQuery();
		            if (result.next()) {
		    			HttpSession session = request.getSession();
		    			session.setAttribute("email", email);
		    			session.setAttribute("password", password);
		    			session.setAttribute("sexe", sexe);
		            	response.sendRedirect("/Pgl/map");
		            }
		            else {
		            	request.setAttribute("error", "Identifiant ou mot de passe incorrect !");
		            	RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/connexion.jsp");
		            	rq.include(request, response);
		            }
		          
				}
				
			} catch (Exception ex){
				out.println("Exception : "+ex.getMessage());
			}
		}
	}

}
