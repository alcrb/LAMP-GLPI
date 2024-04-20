# Après le script aller sur votre navigateur:


1) Installer GLPI (http://192.168.X.X/glpi)
2) Sélectionnez la langue souhaitez
3) Acceptez les conditions d’utilisation.
4) Cliquez sur Installer :
5) Une liste de tests va s’afficher, si vous avez tout suivi, vous n’aurez pas d’erreur hormis la dernière tout en bas qui indique : “L’accès web au dossier « files » ne devrait pas être autorisé. Vérifier le fichier.htaccess et la configuration du serveur web” N’en prenez pas compte, cliquez sur Continuer :
6) Renseignez les informations de votre base de données SQL (localhost / GLPI_admin / YourPassword )
7) Sélectionnez ensuite votre base de données précédemment créées glpi puis continuer :
8) La BDD va s’initialiser, patientez quelques secondes…
9) Choisissez d’envoyer ou non vos données de statistiques.
10) Vous pouvez soutenir le projet si vous le souhaitez, sinon cliquez sur Continuer.
11) Il reste plus qu’à vous connecter avec l’identifiant par défaut glpi et le mot de passe glpi et changer les mots de passe des comptes sensibles.

# Installer et activer le plugin Fusion Inventory

1) Dans les menus de gauche aller dans Configuration
2) Sélectionner Plugins
3) Dans actions cliquer sur le dossier pour l'installer
4) Cliquer sur le pop-up qui apparaît pour l'activer

# Supprimer fichier install.php de glpi

rm /var/www/html/glpi/install/install.php
