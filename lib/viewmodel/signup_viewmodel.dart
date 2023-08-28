// Le code représente le modèle de vue (ViewModel) pour la fonction d'inscription.
// Dans le modèle MVVM (Modèle-Vue-Modèle de Vue), le ViewModel agit comme un
//intermédiaire entre la Vue (l'interface utilisateur) et le Modèle (la logique
//métier et les données). Dans ce cas, le ViewModel se connecte à UserRepository
//pour effectuer des opérations d'inscription.
// Lorsqu'une tentative d'inscription est effectuée, si elle réussit, l'ID de
// l'utilisateur est renvoyé. Si elle échoue, une exception est lancée, indiquant
// un message d'erreur. L'utilisation d'opérations asynchrones (async/await)
//indique que l'inscription est probablement une opération de réseau, et elle est
//traitée de manière asynchrone pour ne pas bloquer le fil d'exécution principal.

// signup_viewmodel.dart

// Importation des packages et modules nécessaires.
import 'package:taskoo/models/user_model.dart';
import 'package:taskoo/repository/user_repository.dart';

// Classe représentant le modèle de vue pour la fonction d'inscription.
// Son principal rôle est de servir de pont entre la logique métier (dans ce cas, s'inscrire)
// et la vue (l'interface utilisateur).
class SignupViewModel {
  // Une instance de UserRepository. Cette classe est probablement responsable de
  // la communication directe avec Firebase ou toute autre base de données pour les opérations utilisateur.
  final UserRepository _userRepository;

  // Constructeur pour SignupViewModel.
  // Si aucune instance de UserRepository n'est fournie lors de la création de SignupViewModel,
  // une nouvelle instance est créée par défaut.
  SignupViewModel({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository();

  // Une méthode asynchrone pour s'inscrire en utilisant un modèle utilisateur.
  // Si l'inscription est réussie, elle retourne l'ID de l'utilisateur.
  // En cas d'échec, elle jette une exception avec le message d'erreur.
  Future<String?> signUp(UserModel user) async {
    try {
      // Tentative d'inscription en utilisant UserRepository.
      var firebaseUser =
          await _userRepository.signUp(user.email, user.password, user.name);

      // Vérifie si la réponse de _userRepository.signUp est non nulle (c'est-à-dire, si l'inscription a réussi).
      if (firebaseUser != null) {
        return firebaseUser
            .uid; // Retourner l'ID de l'utilisateur après une inscription réussie
      } else {
        // Dans un scénario réel, vous pourriez vouloir gérer ce cas différemment.
        // Peut-être en lançant une exception ou en retournant un message d'erreur personnalisé.
        return null;
      }
    } catch (error) {
      // Si une erreur se produit lors de l'appel à _userRepository.signUp, une exception est lancée avec un message d'erreur.
      throw Exception('Erreur lors de l\'inscription: $error');
    }
  }
}
