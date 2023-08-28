// SignupEvent est une classe abstraite qui représente les différents événements
// qui peuvent se produire lors du processus d'inscription.
// SignupUserEvent est un événement spécifique qui se déclenche lorsqu'un
//utilisateur souhaite s'inscrire. Il contient les informations nécessaires
// telles que l'email, le mot de passe et le nom de l'utilisateur.

// La classe abstraite SignupEvent représente les différents événements possibles lors du processus d'inscription.
abstract class SignupEvent {}

// L'événement de demande d'inscription avec les informations nécessaires.
class SignupUserEvent extends SignupEvent {
  final String email; // Email de l'utilisateur lors de l'inscription.
  final String password; // Mot de passe choisi par l'utilisateur.
  final String name; // Nom de l'utilisateur.

  SignupUserEvent(this.email, this.password, this.name);
  // Constructeur pour initialiser les données nécessaires lors de la demande d'inscription.
}
