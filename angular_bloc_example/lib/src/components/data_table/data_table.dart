import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angulardart_test_components/src/routes.dart';

@Component(
    selector: 'data-table',
    templateUrl: 'data_table.html',
    directives: [
      coreDirectives,
      RouterOutlet,
    ],
    exports: [Routes],
    directiveTypes: [

    ],
    changeDetection: ChangeDetectionStrategy.OnPush)

class DataTableComponent {

}