package com.servlets;

import java.io.BufferedInputStream;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bdd.Formulaire;
import com.beans.Utilisateur;
import javax.servlet.http.Part;

@WebServlet("/Inscription2")
public class Inscription2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Formulaire formulaire = new Formulaire();
	
	
	public static final int TAILLE_TAMPON = 10240;

	/* a changer pour pouvoir le faire sur le serveur */	
	//public static final String CHEMIN_FICHIERS = ""; 
	/*chemin alexis*/
	//public static final String CHEMIN_FICHIERS = "H:\\document part2\\B3\\pgl\\fichier";
	/*chemin nora*/
	//public static final String CHEMIN_FICHIERS = "D:\\Fichiers-PGL\\Fichiers";
	/*chemin serveur*/
	public static final String CHEMIN_FICHIERS = "/usr/share/tomcat/webapps/Pgl/Upload/fichier/";

/*
 * <multipart-config>
    <!--<location>  chemin sur le serveur </location>  -->
        <!--<location>H:\document part2\B3\pgl\fichierTMP</location>  --> 
        <location>/Upload/fichierTempo</location>
        <max-file-size>10485760</max-file-size> <!-- 10 Mo -->
        <max-request-size>52428800</max-request-size> <!-- 5 x 10 Mo -->
    	<file-size-threshold>1048576</file-size-threshold> <!-- 1 Mo -->
    </multipart-config>
    */
 
	
    public Inscription2() {
        super();

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/inscription.jsp");
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

        // On recupere le champ description comme d'habitude
        String description = request.getParameter("description");
        request.setAttribute("description", description );

        // On recupere le champ du fichier
        Part part = request.getPart("fichier");
            

        String nomFichier = getNomFichier(part);

        // Si on a bien un fichier
        if (nomFichier != null && !nomFichier.isEmpty()) {
            String nomChamp = part.getName();
            // Corrige un bug du fonctionnement d'Internet Explorer
             nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
                    .substring(nomFichier.lastIndexOf('\\') + 1);


            // On ecrit definitivement le fichier sur le disque
            ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);

            request.setAttribute(nomChamp, nomFichier);
        }
        
        
        try {
			formulaire.formulaireUtilisateur(utilisateur);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/connexion.jsp");
		dispatcher.forward(request, response);	
	}
    
    
	
	private void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        } finally {
            try {
                sortie.close();
            } catch (IOException ignore) {
            }
            try {
                entree.close();
            } catch (IOException ignore) {
            }
        }
    }
	
   
    private static String getNomFichier( Part part ) {
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
    }
   
	
}
