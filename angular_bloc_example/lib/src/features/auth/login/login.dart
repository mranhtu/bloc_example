import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:core/core.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';
import 'package:ng_modular_admin/validators.dart' as validators;

import '../../../routes.dart';
import 'login_state.dart';

@Component(
  selector: 'login-component',
  templateUrl: 'login.html',
  styleUrls: ['login.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
    modularAdminDirectives,
    MaterialButtonComponent,
    LoginStateComponent
  ],
  providers: [
    modularAdminProviders,
    materialProviders,
    ClassProvider(LoginBloc),
    ClassProvider(AuthBloc)
  ],
  pipes: [BlocPipe],
  exports: [Routes],
)
class LoginComponent implements OnInit {
  final keyValueStore = WebKeyValueStore(window.localStorage);
  Router router;
  ControlGroup loginForm;
  DocumentService doc;
  bool shake = false;

  @Input()
  LoginBloc loginBloc;
  @Input()
  UserRepository userRepository;
  @Input()
  AuthBloc authBloc;

  LoginComponent(this.doc, this.router) {
    doc.title = 'Login';
    loginForm = FormBuilder.controlGroup({
      'username': ['', validators.required()],
      'password': ['', validators.required()],
    });
  }

  @override
  void ngOnInit() {
    userRepository = UserRepository(keyValueStore: keyValueStore);
    authBloc = AuthBloc(userRepository: userRepository);
    loginBloc = LoginBloc(
        userRepository: userRepository,
        authBloc: AuthBloc(userRepository: userRepository));
  }

  void login() {
    var password = loginForm.controls['password'].value;
    var username = loginForm.controls['username'].value;

    loginBloc.add(LoginButtonPressed(email: username, password: password));

    ///how to listen state change

    print(authBloc?.state);

    authBloc.listen((state) {
      print(state);
    });
  }
}
