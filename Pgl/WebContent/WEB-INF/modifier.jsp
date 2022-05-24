<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AppData - Configuration information</title>

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
                    	<a href="/Pgl/map">Carte</a>
                    	<a href="Accueil">Se déconnecter</a>
                	</nav>
            	</div>
	</header>
	<section class="container-fluid inscription-done ">
		<h1 style="text-align:center">Configuration Information Personnele</h1>   
	</section>
	 <section class="container-fluid">
            <div class="container"> 
            <form action="inscription" enctype="multipart/form-data" id="inscription" method="post" class="form" role="form" >
                    <div class="row">
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="nom">Nom *</label>
                            <input class="form-control" id="nom" name="nom" placeholder=${ sessionScope.User.nom } type="text" required autofocus />
                        </div>
                        <div class="col-xs-6 col-md-6 form-group">
                            <label for="prenom">Prénom *</label>
                            <input class="form-control" id="prenom" name="prenom" placeholder=${ sessionScope.User.prenom } type="text" required />
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
                            <input class="form-control" id="date" name="date" value=${ sessionScope.User.date } min="1960-01-01" max="2003-12-31" type="date" required>
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
                        <div class="col-xs-12 col-md-12 form-group">
                            <input class="btn btn-primary pull-right" type="submit" value="Enregister"></input>
                        </div>

                    </div>
                </form>
            </div>
        </section>
 <!-- footer -->
        <%@ include file="footer.jsp" %>


    </body>
</html>