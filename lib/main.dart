// Le code crée une application Flutter qui utilise la bibliothèque flutter_bloc
//pour la gestion d'état et initialise Firebase au démarrage.
// L'application a un écran principal (MyHomePage) qui affiche un compteur.
//L'utilisateur peut augmenter le compteur en appuyant sur un bouton flottant.
// Le MyApp widget encapsule son enfant dans un BlocProvider, ce qui signifie
//que tout widget enfant peut accéder à la logique d'inscription fournie par SignupBloc.
// La gestion d'état est largement facilitée par l'utilisation du BLoC pattern,
//qui sépare la logique métier de l'interface utilisateur, permettant une meilleure
// maintenance et testabilité.

// Étape 1: Importez les dépendances nécessaires.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Gestionnaire de flux d'état pour Flutter
import 'package:taskoo/repository/user_repository.dart'; // Gère les opérations liées à l'utilisateur
import 'package:taskoo/bloc/SignUp/signup_bloc.dart'; // Logique liée au processus d'inscription

void main() async {
  // Assurez-vous que Flutter est initialisé avant d'utiliser certaines fonctionnalités.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialise Firebase pour votre application.
  await Firebase.initializeApp();
  runApp(const TaskooApp());
}

class TaskooApp extends StatelessWidget {
  const TaskooApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Étape 2: Encapsulez votre MaterialApp avec BlocProvider.
    // BlocProvider fournit le SignupBloc aux widgets enfants, leur permettant d'accéder à la logique d'inscription.
    return BlocProvider(
      create: (context) => SignupBloc(UserRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true, // Utilise le dernier design Material.
        ),
        // Ceci est le widget principal affiché au démarrage de l'application.
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

// Un widget de page d'accueil simple avec un compteur.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Cette fonction augmente la valeur du compteur.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Crée l'UI pour la page d'accueil.
    return Scaffold(
      appBar: AppBar(
        // Utilise les couleurs du thème actuel.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // Bouton flottant qui, lorsqu'il est cliqué, augmente la valeur du compteur.
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
