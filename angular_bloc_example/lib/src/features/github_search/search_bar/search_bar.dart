import 'package:angular/angular.dart';
import 'package:core/core.dart';


@Component(
  selector: 'search-bar',
  templateUrl: 'search_bar.html',
)
class SearchBarComponent {
  @Input()
  GithubSearchBloc githubSearchBloc;

  @Input()
  GithubSearchState state;

  void onTextChanged(String text) {
    githubSearchBloc.add(TextChanged(text: text));
    print(state);
  }
}
