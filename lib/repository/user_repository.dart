// UserRepository est une classe qui encapsule la logique d'interaction avec Firebase Authentication.
// Elle fournit une méthode pour s'inscrire en utilisant un email, un mot de passe et un nom.
// Le constructeur est flexible, permettant d'injecter une instance de FirebaseAuth pour la tester ou d'utiliser l'instance par défaut.
// Si l'inscription réussit, elle met à jour le profil de l'utilisateur avec le nom fourni, puis recharge les données de l'utilisateur pour s'assurer qu'elles sont à jour.
// Les erreurs lors de l'inscription sont gérées en levant une exception.

// Importation de la bibliothèque nécessaire pour intégrer Firebase Authentication à l'application.
import 'package:firebase_auth/firebase_auth.dart';

// La classe UserRepository est une couche d'abstraction entre l'application et Firebase Authentication.
// Elle est conçue pour effectuer toutes les opérations liées à l'authentification utilisateur.
class UserRepository {
  // _firebaseAuth est une instance de FirebaseAuth,
  // qui est utilisée pour interagir avec le backend Firebase Authentication.
  final FirebaseAuth _firebaseAuth;

  // Ce constructeur permet d'injecter une instance de FirebaseAuth si nécessaire (pratique pour les tests).
  // Si aucune instance n'est fournie, il utilise l'instance par défaut de FirebaseAuth.
  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // La méthode signUp tente de créer un nouvel utilisateur avec l'email, le mot de passe et le nom fournis.
  Future<User?> signUp(String email, String password, String name) async {
    try {
      // Tente de créer un nouvel utilisateur avec l'email et le mot de passe.
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Après la création de l'utilisateur, met à jour son profil avec le nom fourni.
      await result.user?.updateDisplayName(name);

      // Recharge l'utilisateur après la mise à jour du profil pour obtenir les données à jour.
      await result.user?.reload();

      // Retourne l'utilisateur nouvellement créé.
      return result.user;
    } catch (error) {
      // En cas d'erreur lors de la création de l'utilisateur, une exception est levée avec un message d'erreur.
      throw Exception('Erreur lors de l\'inscription: $error');
    }
  }
}
