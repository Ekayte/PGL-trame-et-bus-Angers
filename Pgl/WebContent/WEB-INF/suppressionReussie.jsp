<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>AppData - Supprimer un utilisateur</title>

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
           	</div>
		</header>        
		<section class="container-fluid inscription-done ">
			<h1 style="text-align:center">Suppression réussie !</h1>   
		</section>
		<section class="container-fluid">
			<div class="container-fluid">
				<input class="btn btn-primary pull-right ajout-done" type="button" value="Retour au gestionnaire" onclick="window.location='Gestion';" />
			</div>
		</section>
		<%@ include file="footer.jsp" %>
</body>
</html>