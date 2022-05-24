package com.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;


import com.beans.Utilisateur;

public class Formulaire {
	
	public int formulaireUtilisateur(Utilisateur utilisateur) throws ClassNotFoundException{
		String inscription = "INSERT INTO utilisateurs" + 
							"(nom, prenom, sexe, date, email, password, habitudes, frequence, statut, id)" + 
							"VALUES(?, ?, ?, ?, ?, md5(?), ?, ?, ?, ?);";
		int resultat = 0;
		
        Class.forName("org.mariadb.jdbc.Driver");
        
        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata", "adminapp", "appdata");
        
            PreparedStatement preparedStatement = connexion.prepareStatement(inscription);
            preparedStatement.setString(1, utilisateur.getNom());
            preparedStatement.setString(2, utilisateur.getPrenom());
            preparedStatement.setString(3, utilisateur.getSexe());
            preparedStatement.setString(4, utilisateur.getDate());
            preparedStatement.setString(5, utilisateur.getEmail());
            preparedStatement.setString(6, utilisateur.getPassword());
            preparedStatement.setString(7, utilisateur.getHabitudes());
            preparedStatement.setString(8, utilisateur.getFrequence());
            preparedStatement.setString(9, utilisateur.getStatut());
            preparedStatement.setString(10, utilisateur.getId());
        
            System.out.println(preparedStatement);
            System.out.println("test");
            
            resultat = preparedStatement.executeUpdate();
        
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;
		
	}
   
 
}