// SignupBloc est une classe qui gère la logique de l'état et des événements
// liés au processus d'inscription.
// Elle étend la classe générique Bloc et utilise les événements de type
// SignupEvent et les états de type SignupState.
// Le constructeur prend un UserRepository en argument pour gérer l'inscription.
// La méthode mapEventToState est appelée lorsque des événements sont envoyés
//au bloc. Elle effectue l'inscription et émet des états tels que SignupLoading,
//SignupSuccess ou SignupFailure en fonction du résultat.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskoo/repository/user_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

// La classe SignupBloc étend la classe générique Bloc et gère la logique de l'état et des événements pour le processus d'inscription.
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;

  // Constructeur du SignupBloc qui prend un UserRepository comme argument et initialise l'état initial.
  SignupBloc(this.userRepository) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupUserEvent) {
      yield SignupLoading(); // Émet l'état SignupLoading pour afficher un indicateur de chargement.

      try {
        // Appel de la méthode signUp du UserRepository pour effectuer l'inscription.
        await userRepository.signUp(event.email, event.password, event.name);
        yield SignupSuccess(); // Émet l'état SignupSuccess en cas de réussite de l'inscription.
      } catch (error) {
        yield SignupFailure(error
            .toString()); // Émet l'état SignupFailure en cas d'échec de l'inscription.
      }
    }
  }
}
