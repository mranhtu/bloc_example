
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

import '../../../routes.dart';

@Component(
  selector: 'login-component',
  templateUrl: 'login.html',
  styleUrls: ['login.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
    modularAdminDirectives,
    MaterialButtonComponent
  ],
  providers: [
    modularAdminProviders
  ],
  exports: [Routes],
)

class LoginComponent {
  bool shake = false;
}
