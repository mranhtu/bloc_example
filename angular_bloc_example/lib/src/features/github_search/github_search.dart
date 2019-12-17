import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:core/core.dart';

import 'search_bar/search_bar.dart';
import 'search_body/search_body.dart';

@Component(
  selector: 'github-search',
  templateUrl: 'github_search.html',
    directives: [
      SearchBarComponent,
      SearchBodyComponent,
    ],
    pipes: [
      BlocPipe
    ]
)
class GithubSearchComponent implements OnInit, OnDestroy {

  @Input()
  GithubRepository githubRepository = GithubRepository(
      GithubCache(),
      GithubClient(),
      );

  GithubSearchBloc githubSearchBloc;

  @override
  void ngOnInit() {
    githubSearchBloc = GithubSearchBloc(
      githubRepository: githubRepository,
    );
  }

  @override
  void ngOnDestroy() {
    githubSearchBloc.close();
  }
}
