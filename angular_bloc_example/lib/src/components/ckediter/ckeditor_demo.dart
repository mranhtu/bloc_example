import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_bloc_example/src/routes.dart';

@Component(
    selector: 'ckeditor-demo',
    templateUrl: 'ckeditor_demo.html',
    directives: [
      coreDirectives,
      RouterOutlet,
    ],
    exports: [Routes],
    changeDetection: ChangeDetectionStrategy.OnPush)
class CkeditorDemoComponent {}
