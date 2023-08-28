// L'essentiel de ce code concerne la création d'un écran d'inscription.
// L'utilisateur peut remplir un formulaire avec son nom, son e-mail et son
// mot de passe. Une fois que l'utilisateur soumet ce formulaire, un événement
// est envoyé à un "bloc" (une logique d'affaires) pour traiter cette demande
// d'inscription. Si l'inscription est réussie, l'utilisateur est redirigé vers
// la page d'accueil, sinon, un message d'erreur est affiché.

// Importation des packages nécessaires.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskoo/bloc/SignUp/signup_bloc.dart';
import 'package:taskoo/bloc/SignUp/signup_state.dart';
import 'package:taskoo/bloc/SignUp/signup_event.dart';
import 'package:taskoo/view/home_page.dart';

// Déclaration du widget SignupView, qui est un StatefulWidget,
// ce qui signifie qu'il a un état mutable associé.
class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  // La méthode createState est utilisée pour créer l'objet d'état mutable.
  @override
  SignupViewState createState() => SignupViewState();
}

// SignupViewState est l'état associé au widget SignupView.
class SignupViewState extends State<SignupView> {
  // Déclaration des contrôleurs pour les champs de formulaire.
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  // La méthode build est utilisée pour décrire l'interface utilisateur du widget.
  @override
  Widget build(BuildContext context) {
    // BlocConsumer est utilisé pour gérer les événements et les états
    // liés à l'inscription avec le package Bloc.
    return BlocConsumer<SignupBloc, SignupState>(
      // Cette fonction est appelée chaque fois qu'il y a un changement d'état dans SignupBloc.
      listener: (context, state) {
        if (state is SignupSuccess) {
          // Si l'inscription est réussie, naviguez vers la page d'accueil.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (state is SignupFailure) {
          // En cas d'échec de l'inscription, affichez un message d'erreur.
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        // Cette fonction construit l'interface utilisateur en fonction de l'état actuel.
        return Scaffold(
          appBar: AppBar(title: const Text('Inscription')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Champ pour entrer le nom.
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nom'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Champ pour entrer l'email.
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un e-mail';
                      } else if (!value.contains('@')) {
                        return 'Veuillez entrer un e-mail valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Champ pour entrer le mot de passe.
                  TextFormField(
                    controller: _passwordController,
                    decoration:
                        const InputDecoration(labelText: 'Mot de passe'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un mot de passe';
                      } else if (value.length < 6) {
                        return 'Le mot de passe doit avoir au moins 6 caractères';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Affiche un indicateur de progression lors de la tentative d'inscription
                  // ou un bouton pour soumettre le formulaire.
                  state is SignupLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          child: const Text('S\'inscrire'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final event = SignupUserEvent(
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text,
                              );
                              // Ajoute un événement d'inscription au bloc pour traitement.
                              BlocProvider.of<SignupBloc>(context).add(event);
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Libération des ressources lorsque le widget est supprimé.
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
