import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_bloc_example/src/routes.dart';

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
