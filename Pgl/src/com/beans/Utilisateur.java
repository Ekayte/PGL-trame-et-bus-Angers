package com.beans;

public class Utilisateur {
    private String nom;
    private String prenom;
    private String sexe;
    private String date;
    private String email;
    private String password;
    private String habitudes;
    private String frequence;
    private String statut;
    private String id;
    
    public Utilisateur(String id, String nom, String prenom, String sexe, String date, String email, 
    		String password, String habitudes, String frequence, String statut) {
    	this.id = id;
    	this.nom = nom;
    	this.prenom = prenom;
    	this.sexe = sexe;
    	this.date = date;
    	this.email = email;
    	this.password = password;
    	this.habitudes = habitudes;
    	this.frequence = frequence;
    	this.statut = statut;
    	
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHabitudes() {
		return habitudes;
	}
	public void setHabitudes(String habitudes) {
		this.habitudes = habitudes;
	}
	public String getFrequence() {
		return frequence;
	}
	public void setFrequence(String frequence) {
		this.frequence = frequence;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	
    

}