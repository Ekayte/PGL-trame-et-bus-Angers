
CREATE DATABASE appdata CHARACTER SET 'utf8';


CREATE TABLE utilisateurs(
        id        Int  Auto_increment  NOT NULL ,
        nom       Varchar (50) NOT NULL ,
        prenom    Varchar (50) NOT NULL ,
        sexe      Varchar (50) NOT NULL ,
        date      Date NOT NULL ,
        email	  Varchar (100) NOT NULL,
        password  Varchar (50) NOT NULL ,
        habitudes Varchar (50) NOT NULL ,
        frequence Varchar (50) NOT NULL ,
        statut    Varchar (50) NOT NULL , 
	CONSTRAINT Utilisateurs_PK PRIMARY KEY (email)
)ENGINE=MariaDB;



CREATE TABLE ligne(
        id_ligne          Int  Auto_increment  NOT NULL ,
        num_ligne         Varchar (3) NOT NULL ,
        note_ligne        Int ,
        commentaire_ligne Text ,
        alerte            Varchar (50),
        id                Int ,
   CONSTRAINT ligne_PK PRIMARY KEY (id_ligne)
)ENGINE=MariaDB;



ALTER TABLE ligne
ADD CONSTRAINT fk_id_id_ligne FOREIGN KEY (id) REFERENCES utilisateurs(id);
