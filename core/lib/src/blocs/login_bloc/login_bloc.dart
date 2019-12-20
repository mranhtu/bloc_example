import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/auth_bloc/bloc.dart';
import 'package:core/src/repositories/repositories.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static const String USER_PROFILE = 'USER_PROFILE';

  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({@required this.userRepository, @required this.authBloc})
      : assert(userRepository != null),
        assert(authBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        yield LoginLoading();
        final user = await userRepository.login(
          email: event.email,
          password: event.password,
        );
        authBloc.add(LoggedIn(token: user.token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
