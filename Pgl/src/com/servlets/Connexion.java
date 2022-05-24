package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Utilisateur;



@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/connexion.jsp");
		dispatcher.forward(request, response);
	}
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			String mail = request.getParameter("email");
			String motdepasse = request.getParameter("password");

					
			try {
				if(mail!=null) {
					Class.forName("org.mariadb.jdbc.Driver");
		            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
		            String query = "select * from utilisateurs where email=? and password=md5(?)";
		            
		            PreparedStatement pst = connexion.prepareStatement(query);
		            pst.setString(1, mail);
		            pst.setString(2, motdepasse);
		            
		            ResultSet result = pst.executeQuery();
            		            
		            if (result.next()) {

		            	ResultSetMetaData rsmData = result.getMetaData();
		            	String id = result.getString(rsmData.getColumnName(1));
		            	String nom = result.getString(rsmData.getColumnName(2));
		            	String prenom = result.getString(rsmData.getColumnName(3));
		            	String sexe = result.getString(rsmData.getColumnName(4));
		            	String date = result.getString(rsmData.getColumnName(5));
		            	String email = result.getString(rsmData.getColumnName(6));
		            	String password = result.getString(rsmData.getColumnName(7));
		            	String habitudes = result.getString(rsmData.getColumnName(8));
		            	String frequence = result.getString(rsmData.getColumnName(9));
		            	String statut = result.getString(rsmData.getColumnName(10));
		            	
		            	Utilisateur user = new Utilisateur(id, nom, prenom, sexe, date, email, password, habitudes, frequence, statut);
		            	HttpSession session = request.getSession();
		            	session.setAttribute("User", user);
		            	session.setAttribute("id", id);
		    			session.setAttribute("email", mail);
		    			session.setAttribute("password", motdepasse);
		    			
		            	if (statut.equals("administrateur")) {
		            		response.sendRedirect("/Pgl/admin");
		            	}
		            	if (statut.equals("dataScientist")) {
		            		response.sendRedirect("/Pgl/dataScientist");
		            	}

		            	else {
		            		response.sendRedirect("/Pgl/map");
		            	}
		            	
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
