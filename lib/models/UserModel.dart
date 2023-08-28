class UserModel {
  final String id;
  final String email;
  final String name;
  final String profileImageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl = '',
  });

  // Pour convertir un objet UserModel en un Map, par exemple pour l'envoyer à Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Pour convertir un Map en un objet UserModel, utile lors de la récupération des données depuis Firebase
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      profileImageUrl: map['profileImageUrl'] ?? '',
    );
  }
}
