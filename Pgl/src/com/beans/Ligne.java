package com.beans;

public class Ligne {

	private String numLigne;
	private String commentaire;
	private String note;
	private String alerte;
	private String id;
	
	public Ligne(String numLigne, String commentaire, String note, String alerte, String id) {
    	this.numLigne = numLigne;
    	this.commentaire = commentaire;
    	this.note = note;
    	this.alerte = alerte;
    	this.id = id;    	
    }
	
	public Ligne() {		
    }
    
	

	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
	public String getNumLigne() {
        return numLigne;
    }
    public void setNumLigne(String numLigne) {
        this.numLigne = numLigne;
    }
    public String getCommentaire() {
        return commentaire;
    }
    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public String getAlerte() {
        return alerte;
    }
    public void setAlerte(String alerte) {
        this.alerte = alerte;
    }
	
}
