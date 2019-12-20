import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_bloc_example/src/routes.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: [
    'app.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'app.html',
  directives: [
    coreDirectives,
    routerDirectives,
    FaIcon,
    formDirectives,
    modularAdminDirectives,
  ],
  providers: [materialProviders, modularAdminProviders],
  exports: [Routes],
)
class AppComponent {
  String searchTerm;
  void handleSubmit() {
    window.alert('You searched for: ');
  }
}
