# Installer GLPI (http://192.168.X.X/glpi)

1) Sélectionnez la langue souhaitez 
2) Acceptez les conditions d’utilisation
3) Cliquez sur Installer :
4) Une liste de test va s’afficher, si vous avez tout suivi, vous n’aurez pas d’erreur hormis la dernière tout en bas qui indique :
“L’accès web au dossier « files » ne devrait pas être autorisé. Vérifier le fichier .htaccess et la configuration du serveur web”
N’en prenez pas compte, cliquez sur Continuer :
5) Renseignez les information de votre base de données SQL (localhost / GLPI_admin / YourPassword )
6) Sélectionnez ensuite votre base de données précédemment créer glpi puis Continuer :
7) La BDD va s’initialiser, patientez quelques secondes… 
8) Choisissez d’envoyer ou non vos données de statistiques
9) Vous pouvez soutenir le projet si vous le souhaiter, sinon cliquez sur Continuer
10) Il reste plus qu’à vous connecter avec l’identifiant par défaut glpi et le mot de passe glpi et changer les mots de passes des comptes sensibles

# Supprimer fichier install.php de glpi

rm /var/www/html/glpi/install/install.php
