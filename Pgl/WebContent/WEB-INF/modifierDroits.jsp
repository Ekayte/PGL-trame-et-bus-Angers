<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
		<meta charset="utf-8">
		<title>AppData - Modification des droits utilisateurs</title>
        <!-- icone site -->
        <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

        <!-- font -->
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
</head>
<body>
        <header class="container-fluid header">
            <div class="container">
                <a href="index.html" class="logo">AppData</a>
                <nav class="menu">
                    <a href="javascript:history.go(-1)">Retour</a>
                </nav>
            </div>
        </header>
 
 		<section class="container-fluid inscription-done ">
			<h1 style="text-align:center">Modifier les droits utilisateurs</h1>   
		</section>
		<section class="container-fluid connexion">
		   <form action="/Pgl/modifierDroits" id="contact" method="post" class="form" role="form">
			    <div class="row">
				    <div class="col-xs-6 col-md-6 form-group form-supp">
				         <label for="email">Utilisateur</label>
				         <input class="form-control css-supp" id="email" name="email" placeholder="Email" type="email" autofocus/>	 
				    </div>
				    <div class="col-xs-6 col-md-6 form-group form-supp">
                      	<input type="checkbox" id="utilisateur" value="utilisateur" class="choix" name="statut">
                   		<label for="utilisateur">Utilisateur</label>
                   		<input type="checkbox" id="dataScientistCheck" value="dataScientist" class="choix" name="statut"/>
                   		<label for="dataScientist">Data Scientist</label>
                   		<input type="checkbox" id="administrateurCheck" value="administrateur"class="choix" name="statut"/>
                   		<label for="administrateur">Administrateur</label>
				    </div>
				    <div class="col-xs-6 col-md-6 form-group btn-supprimer">
				         <input class="btn btn-primary pull-right" type="submit" value="Envoyer"/>	 
				    </div>
				</div>
			</form>
		</section>

        <%@ include file="footer.jsp" %>

</body>
</html>