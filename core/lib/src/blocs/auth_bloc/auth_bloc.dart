import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/src/repositories/repositories.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({this.userRepository}) : assert(userRepository != null);

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthLoading();
      await userRepository.persistToken(event.token);
      yield AuthAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthLoading();
      await userRepository.deleteToken();
      yield AuthUnauthenticated();
    }
  }
}
