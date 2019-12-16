import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angulardart_test_components/src/routes.dart';

@Component(
    selector: 'ckeditor-demo',
    templateUrl: 'ckeditor_demo.html',
    directives: [
      coreDirectives,
      RouterOutlet,
    ],
    exports: [Routes],
    changeDetection: ChangeDetectionStrategy.OnPush
)
class CkeditorDemoComponent {
}
