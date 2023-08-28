// SignupState est une classe abstraite qui représente les différents états
//possibles du processus d'inscription.
// SignupInitial est l'état initial de l'inscription.
// SignupLoading est l'état de chargement pendant le processus d'inscription.
// SignupSuccess est l'état de succès après une inscription réussie.
// SignupFailure est l'état d'échec de l'inscription, contenant un message
//d'erreur associé à l'échec.

// La classe abstraite SignupState représente les différents états de l'inscription.
abstract class SignupState {}

// L'état initial de l'inscription.
class SignupInitial extends SignupState {}

// L'état de chargement pendant le processus d'inscription.
class SignupLoading extends SignupState {}

// L'état de succès après une inscription réussie.
class SignupSuccess extends SignupState {}

// L'état d'échec de l'inscription, contenant des informations sur l'erreur.
class SignupFailure extends SignupState {
  final String error; // Message d'erreur associé à l'échec de l'inscription.

  SignupFailure(this.error); // Constructeur pour initialiser l'erreur.
}
