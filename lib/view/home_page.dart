// Le code ci-dessus décrit une page d'accueil basique pour une application
//Flutter. La page contient une barre d'application avec le titre "Page d'accueil".
//Sous cette barre, au centre de la page, il y a une image (votre logo) et un
//texte de bienvenue. Le tout est structuré dans un Scaffold, qui est un layout
//de base pour la conception d'applications Material Design. Le code est bien
//organisé et utilise les widgets de base de Flutter pour créer une interface
// utilisateur simple mais élégante

// Importation du package Flutter Material Design nécessaire pour la conception de l'interface utilisateur.
import 'package:flutter/material.dart';

// Définition d'une nouvelle classe de page d'accueil appelée HomePage.
// Cette classe hérite de StatelessWidget, ce qui signifie qu'elle est immuable.
// Une fois que vous fournissez des données à cette classe, elles ne peuvent pas être modifiées.
class HomePage extends StatelessWidget {
  // Constructeur de la classe. Il prend en option un "key" pour gérer efficacement les widgets dans Flutter.
  // La méthode super est appelée avec la clé pour l'envoyer à la classe parente (StatelessWidget).
  const HomePage({Key? key}) : super(key: key);

  // Méthode obligatoire pour tous les widgets. Elle décrit comment le widget doit être construit visuellement.
  @override
  Widget build(BuildContext context) {
    // Le Scaffold est un widget de base pour la création de visuels typiques de l'application Material.
    return Scaffold(
      // AppBar est un widget qui représente la barre d'application en haut de l'écran.
      appBar: AppBar(
        title: const Text("Page d'accueil"), // Titre de la barre d'application.
      ),
      // Le corps principal du Scaffold.
      body: Center(
        // Le widget Center centre son widget enfant.
        child: Column(
          // Alignement des éléments de la colonne au centre.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Un widget pour afficher une image à partir d'un actif.
            // Vous devez remplacer 'path_to_your_logo.png' par le chemin d'accès réel de votre logo dans le dossier d'actifs.
            Image.asset(
                'logo_task.png'), // Remplacez par le chemin de votre logo
            // Un widget Text pour afficher un texte.
            const Text("Bienvenue sur l'application!"),
          ],
        ),
      ),
    );
  }
}
