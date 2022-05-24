package com.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.beans.Ligne;

public class LigneFormulaire {
	
	public int formulaireLigne(Ligne ligne) throws ClassNotFoundException{
		String map = "INSERT INTO ligne" + 
							"(num_ligne, note_ligne, commentaire_ligne, alerte, id)" + 
							"VALUES(?, ?, ?, ?, ?);";
		int resultat = 0;
	
        Class.forName("org.mariadb.jdbc.Driver");
        
        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
        
            PreparedStatement preparedStatement = connexion.prepareStatement(map);
            preparedStatement.setString(1, ligne.getNumLigne());
            preparedStatement.setString(2, ligne.getNote());
            preparedStatement.setString(3, ligne.getCommentaire());
            preparedStatement.setString(4, ligne.getAlerte());
            preparedStatement.setString(5, ligne.getId());
            
            System.out.println(preparedStatement);
            
            resultat = preparedStatement.executeUpdate();
        
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        
        return resultat;
		
	}
	public List<Ligne> recupererLignes() {
        List<Ligne> lignes = new ArrayList<Ligne>();
        Statement statement = null;
        ResultSet resultat = null;
        
       

     // Chargement du driver
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
        	
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
            statement = connexion.createStatement();
         // Exécution de la requête
            resultat = statement.executeQuery("SELECT num_ligne, note_ligne, commentaire_ligne, alerte, id  FROM ligne;");

            // Récupération des données
            while (resultat.next()) {
                
                String num = resultat.getString("num_ligne");
                String note = resultat.getString("note_ligne");
                String commentaire = resultat.getString("commentaire_ligne");
                String alerte = resultat.getString("alerte");
                String id = resultat.getString("id");
                
                Ligne ligne = new Ligne(num, note, commentaire, alerte, id);
                
                ligne.setNumLigne(num);
                ligne.setNote(note);
                ligne.setCommentaire(commentaire);
                ligne.setAlerte(alerte);
                ligne.setId(id);
                
                lignes.add(ligne);
                //System.out.println(ligne);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return lignes;
    }
	
}




