<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>AppData - S'inscrire</title>

        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">

    </head>


     <!-- contenu du site -->
     <body>
        <!-- header -->
        <%@ include file="menu.jsp" %>
        <!-- fin header -->

        <!-- bannière -->
        <section class="container-fluid banner2">
            <div class="ban-contact">
                <img src="img/inscription.png" alt="S'inscrire"  height="300px" />
            </div>
            <div class="inner-banner">
                <h1> S'inscrire </h1>
            </div>
        </section>
        <!-- fin bannière -->

        <!-- formulaire -->
        <section class="container-fluid formulaire2 form2">
            <div class="container">
                <h3 id="question">Nouveau membre? Inscrivez-vous!</h3>
                <hr class="separateur">
            </div>
        </section>
        <section class="container-fluid">
            <div class="container">
                <p id="sous-contact">Remplissez le formulaire ci-dessous.</p>                
                <form action="inscription" enctype="multipart/form-data" id="inscription" method="post" class="form" role="form" >
                    <div class="row">
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="nom">Nom *</label>
                            <input class="form-control" id="nom" name="nom" placeholder="Nom" type="text" required autofocus />
                        </div>
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="prenom">Prénom *</label>
                            <input class="form-control" id="prenom" name="prenom" placeholder="Prénom" type="text" required />
                        </div>
                        <div class="col-xs-6 col-md-6 form-group inscrire">
                            <label for="sexe">Sexe *</label>
                            <select class="form-control" id="sexe" name="sexe" required >
                                <option value="H">Homme</option>
                                <option value="F">Femme</option>
                                <option value="non-precise">Non précisé</option>
                                <option value="autre">Autre</option>
                            </select>
                        </div>
                        <div class="col-xs-6 col-md-6 form-group inscrire">
                            <label for="date">Date de naissance *</label>
                            <input class="form-control" id="date" name="date" value="2020-11-01" min="1960-01-01" max="2003-12-31" type="date" required>
                        </div>
                        <div class="col-xs-6 col-md-6 form-group inscrire">
                            <label for="email">Email *</label>
                            <input class="form-control" id="email" name="email" placeholder="Email" type="email" required />
                        </div>
                        <div class="col-xs-6 col-md-6 form-group inscrire">
                            <label for="password">Mot de passe * (8 charactères min.)</label>
                            <input class="form-control" id="password" name="password" placeholder="Mot de passe" type="password" minlength="8" required />
                        </div>
                        <div class="col-xs-12 col-md-12 form-group inscrire">
                            <label>Habitudes de déplacement</label><br>
                            <input class="choix" name="habitudes" type="checkbox" value="pieds" id="pieds" />
                            <label for="pieds">À pieds</label>
                            <input class="choix" name="habitudes" type="checkbox" value="voiture" id="voiture" />
                            <label for="voiture">En voiture</label>
                            <input class="choix" name="habitudes" type="checkbox" value="velo" id="velo" />
                            <label for="velo">À vélo</label>
                            <input class="choix" name="habitudes" type="checkbox" value="transports" id="transports" />
                            <label for="transports">En transports</label>
                        </div>
                        <div class="col-xs-12 col-md-12 form-group inscrire">
                            <label for="frequence">Fréquence d'utilisation des transports en commun</label>
                            <select class="form-control" id="frequence" name="frequence" >
                                <option value="quotidien">Quotidien</option>
                                <option value="hebdomadaire">Hebdomadaire</option>
                                <option value="mensuel">Mensuel</option>
                                <option value="episodique">Épisodique</option>
                                <option value="jamais">Jamais</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-md-12 form-group inscrire"/>
                        	<input type="checkbox" id="utilisateur" value="utilisateur" class="choix" name="statut">
                       		<label for="utilisateur">Utilisateur</label>
                       		
                       		<input type="checkbox" id="dataScientistCheck" onclick="dataScientistDisplay()" value="dataScientist" class="choix" name="statut"/>
                       		<label for="dataScientist">Data Scientist</label>
							<div id="displayDataScientist" style="display:none">
								<hr>
                					<p>En tant que Data Scientist vous aurez accès aux données liées aux transports en commun d'Angers 
                					ainsi qu'à de nombreux graphiques.
                					</p><br>
                					<p>
            							<label for="societe">Nom de société : </label>
            							<input type="text" name="societe" id="societe" class="societe"/>
        							</p>
        							
        							<c:if test="${ !empty fichier }"><p><c:out value="Le fichier ${ fichier } (${ description }) a été uploadé !" /></p></c:if>
        								<p>
            								<label for="description">Description du fichier : </label>
            								<input type="text" name="description" id="description" />
        								</p>
        								<p>
            								<label for="fichier">Fichier à envoyer : </label>
            								<input type="file" name="fichier" id="fichier" />
       									</p>
       							<hr>
              				</div>
       					</div>
                        <div class="col-xs-12 col-md-12 form-group">
                            <input class="btn btn-primary pull-right" type="submit" value="Envoyer"></input>
                            
                        </div>
                    </div>            
                </form>
            </div>          
        </section>
                
        <!-- footer -->
        <%@ include file="footer.jsp" %>

<script type="text/javascript">
   function dataScientistDisplay() {
	   // Get the checkbox
	   var checkBox = document.getElementById("dataScientistCheck");
	   // Get the output text
	   var text = document.getElementById("displayDataScientist");

	   // If the checkbox is checked, display the output text
	   if (checkBox.checked == true){
	     text.style.display = "block";
	   } else {
	     text.style.display = "none";
	   }
	 }  
</script> 
    </body>
</html>