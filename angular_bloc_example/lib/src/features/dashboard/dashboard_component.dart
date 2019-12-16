import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

import '../../routes.dart';

@Component(
  selector: 'dashboard-component',
  styleUrls: [
    'dashboard_component.css',
  ],
  templateUrl: 'dashboard_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    modularAdminDirectives,
  ],
  providers: [
    modularAdminProviders
  ],
  exports: [Routes],
)

class DashboardComponent {

}