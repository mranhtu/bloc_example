import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:core/core.dart';

@Component(
    selector: 'search-body',
    templateUrl: 'search_body.html',
    directives: [
      coreDirectives,
      MaterialSpinnerComponent,
      MaterialIconComponent,
    ],
    providers: [
      materialProviders
    ])
class SearchBodyComponent {
  @Input()
  GithubSearchState state;

  bool get isEmpty => state is SearchStateEmpty;
  bool get isLoading => state is SearchStateLoading;
  bool get isSuccess => state is SearchStateSuccess;
  bool get isError => state is SearchStateError;

  List<SearchResultItem> get items =>
      isSuccess ? (state as SearchStateSuccess).items : [];

  String get error => isError ? (state as SearchStateError).error : '';
}
