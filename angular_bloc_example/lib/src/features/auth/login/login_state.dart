import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:core/core.dart';

@Component(
    selector: 'login_state',
    templateUrl: 'login_state.html',
    directives: [
      coreDirectives,
      MaterialSpinnerComponent,
      MaterialIconComponent,
    ],
    providers: [
      materialProviders
    ],
)
class LoginStateComponent implements OnInit {
  @Input()
  AuthState authState;

  bool get isEmpty => authState is AuthUninitialized;
  bool get isLoading => authState is AuthLoading;
  bool get isSuccess => authState is AuthAuthenticated;
  bool get isError => authState is AuthUnauthenticated;

  @override
  void ngOnInit() {
    print(authState);
  }
}
