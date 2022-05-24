package com.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bdd.LigneFormulaire;
import com.beans.Ligne;


@WebServlet("/Map")
public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LigneFormulaire ligneFormulaire = new LigneFormulaire();
    
    public Map() {
        super();
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LigneFormulaire tableLignes = new LigneFormulaire();
	    request.setAttribute("lignes", tableLignes.recupererLignes());
	    this.getServletContext().getRequestDispatcher("/WEB-INF/map.jsp").forward(request, response);
	    
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String numLigne = request.getParameter("num_ligne");
        String note = request.getParameter("note_ligne");
        String commentaire = request.getParameter("commentaire_ligne");
        String alerte = request.getParameter("alerte");
        String id = request.getParameter("id");
        
        
        Ligne ligne = new Ligne(numLigne, note, commentaire, alerte, id);
        ligne.setNumLigne(numLigne);
        ligne.setNote(note);
        ligne.setCommentaire(commentaire);
        ligne.setAlerte(alerte);
        ligne.setId(id);
        
        try {
			ligneFormulaire.formulaireLigne(ligne);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        
        LigneFormulaire tableLignes = new LigneFormulaire();
	    request.setAttribute("lignes", tableLignes.recupererLignes());
	    
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/map.jsp");
		dispatcher.forward(request, response);
		
	}
	
}
