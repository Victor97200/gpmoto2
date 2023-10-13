<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/style/css/index.css">
    <title>Accueil</title>
    <?php include "./dao/db.php" ?>
</head>

<body>
    <header>
        <?php include "./vue/header.php" ?>
    </header>

    <div class="content-index">
        <div class="head-index">

            <img id="imgindex" src="./vue/style/img/logo/LogoTurboLoutre.png">
            <br>
            Bienvenue sur le site des Turbo-Loutre
            <?php
            // Créez une instance de la classe Connexion
            $connexion = new Connexion();

            // Obtenez l'objet PDO en appelant la méthode getConnexion()
            $pdo = $connexion->getConnexion();
            ?>
        </div>
    </div>
    <footer>
        <?php include "./vue/footer.php" ?>
    </footer>
</body>

</html>