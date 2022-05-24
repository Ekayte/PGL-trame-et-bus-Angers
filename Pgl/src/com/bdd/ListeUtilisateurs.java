package com.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Utilisateur;

public class ListeUtilisateurs {
		
    public ArrayList<Utilisateur> getResultat() throws ClassNotFoundException {
        ArrayList<Utilisateur> users = new ArrayList<Utilisateur>();
       	Class.forName("org.mariadb.jdbc.Driver"); 

        try {
        	Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.56:3306/appdata","adminapp", "appdata");
            PreparedStatement statement = connexion.prepareStatement("SELECT nom, prenom, email, statut FROM utilisateurs");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Utilisateur user = new Utilisateur(null,null, null, null, null, null, null, null, null, null);
                user.setNom(resultSet.getString(1));
                user.setPrenom(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setStatut(resultSet.getString(4));
                users.add(user);
            }
        
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
