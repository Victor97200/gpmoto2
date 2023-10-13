<?php

class Connexion
{
    private PDO $connexion;

    public function __construct()
    {
        $user = "projet_slam"; 
        $pass = 'XrUOw2JVRovmWsemmAe#oKObJBu0R?M&i@ibiPs6'; 

        // Utilisation d'un tableau associatif pour définir les options PDO
        $pdo_options = [
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'UTF8'",
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ];

        try {
            $this->connexion = new PDO('mysql:host=localhost;dbname=gpmoto', $user, $pass, $pdo_options);
        } catch (PDOException $e) {
            echo 'Erreur de connexion : ' . $e->getMessage();
            // logError($e->getMessage());
        }
    }

    /**
     * @return PDO
     */
    public function getConnexion(): PDO
    {
        return $this->connexion;
    }
}
