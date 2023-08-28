// UserModel est une classe qui représente les données d'un utilisateur dans l'application.
// Le constructeur initialise toutes les propriétés nécessaires, y compris le mot de passe.
// Les méthodes toMap() et fromMap() sont utilisées pour convertir un objet
// UserModel en un Map et vice versa, ce qui est utile pour l'envoi et la
//récupération de données depuis Firebase.

// La classe UserModel représente les informations d'un utilisateur dans l'application.
class UserModel {
  final String id; // Identifiant unique de l'utilisateur
  final String email; // Adresse e-mail de l'utilisateur
  final String
      password; // Mot de passe de l'utilisateur (ajouté à des fins de clarté)
  final String name; // Nom de l'utilisateur
  final String profileImageUrl; // URL de l'image de profil de l'utilisateur

  // Le constructeur de la classe UserModel. Il prend en paramètre toutes les informations nécessaires.
  UserModel({
    required this.id,
    required this.email,
    required this.password, // Mot de passe requis lors de la création d'un utilisateur
    required this.name,
    this.profileImageUrl =
        '', // Valeur par défaut de l'URL de l'image de profil
  });

  // La méthode toMap convertit un objet UserModel en un Map, ce qui est utile pour l'envoyer à Firebase.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password, // Ajout du mot de passe au Map
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  // La factory method fromMap permet de créer un objet UserModel à partir d'un Map,
  // ce qui est utile lors de la récupération des données depuis Firebase.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      password: map['password'], // Récupération du mot de passe depuis le Map
      name: map['name'],
      profileImageUrl: map['profileImageUrl'] ??
          '', // Utilisation de la valeur par défaut si l'URL est absente
    );
  }
}
