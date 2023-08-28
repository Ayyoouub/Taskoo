// signup_view.dart
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  String _email;
  String _password;
  String _name;  // <-- Ajout de la variable pour le nom de l'utilisateur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Champ pour le nom avec validation
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,  // <-- Sauvegarder la valeur dans _name
              ),
              SizedBox(height: 16),
              
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un e-mail';
                  } else if (!value.contains('@')) {
                    return 'Veuillez entrer un e-mail valide';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 16),
              
              TextFormField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  } else if (value.length < 6) {
                    return 'Le mot de passe doit avoir au moins 6 caractères';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 32),
              
              ElevatedButton(
                child: Text('S'inscrire'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Les valeurs valides sont maintenant dans _name, _email, et _password
                    // TODO: ajouter la logique d'inscription
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
