<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>AppData - Gestion des utilisateurs</title>

    <!-- icone site -->
    <link rel="shortcut icon" type="image/ico" href="img/icone-appdata.ico">

    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    

</head>
<body>
	<!-- header -->
	<header class="container-fluid header">
            	<div class="container">
                	<a href="index.html" class="logo">AppData</a>
                	<nav class="menu">
                	    <a href="/Pgl/admin">Carte</a>
	                    <a href="/Pgl/compteAdmin">Mon compte</a>
                    	<a href="Accueil">Se déconnecter</a>
                	</nav>
            	</div>
	</header>
	<!-- fin header -->
	
	<section class="container-fluid inscription-done ">
		<h1 style="text-align:center">Gestion des utilisateurs</h1>   
	</section>
	<section class="container-fluid list-users" >
    <div class="container-fluid">
		<input class="btn btn-primary pull-right add-btn" type="button" value="Ajouter un utilisateur" onclick="window.location='Ajouter';" />
		<input class="btn btn-primary pull-right supp-btn" type="button" value="Supprimer un utilisateur" onclick="window.location='SupprimerAdmin';" />
		<input class="btn btn-primary pull-right supp-btn" type="button" value="Modifier les droits" onclick="window.location='ModifierDroits';" />
	</div>
	<div class="scroller">
		<table class="table table-bordered">
	    <thead>
			<tr>
				<th id="col_nom">Nom</th>
				<th id="col_prenom">Prénom</th>
				<th id="col_email">Email</th>
				<th id="col_statut">Statut</th>
			</tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${users}" var="user">
			<tr>
				<td>${user.nom}</td>
				<td>${user.prenom}</td>
				<td>${user.email}</td>
				<td>${user.statut}</td>
			</tr>
	    </c:forEach>
	    </tbody>
	
	   </table>
	</div>
	</section>
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>