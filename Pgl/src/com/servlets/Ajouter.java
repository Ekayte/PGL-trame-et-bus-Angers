package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bdd.Formulaire;
import com.beans.Utilisateur;


/**
 * Servlet implementation class Ajouter
 */
@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   	private Formulaire formulaire = new Formulaire();	

    public Ajouter() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ajouter.jsp");
		dispatcher.forward(request, response);		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
    	String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String sexe = request.getParameter("sexe");
        String date = request.getParameter("date");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String habitudes = request.getParameter("habitudes");
        String frequence = request.getParameter("frequence");        
        String statut = request.getParameter("statut");
        
        Utilisateur utilisateur = new Utilisateur(id, nom, prenom, sexe, date, email, password, habitudes, frequence, statut);
        utilisateur.setNom(nom);
        utilisateur.setPrenom(prenom);
        utilisateur.setSexe(sexe);
        utilisateur.setDate(date);
        utilisateur.setEmail(email);
        utilisateur.setPassword(password);
        utilisateur.setHabitudes(habitudes);
        utilisateur.setFrequence(frequence);
        utilisateur.setStatut(statut);
        
        try {
			formulaire.formulaireUtilisateur(utilisateur);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ajoutReussi.jsp");
		dispatcher.forward(request, response);	
		}	
}
