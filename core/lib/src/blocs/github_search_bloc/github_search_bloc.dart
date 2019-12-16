import 'dart:async';

import 'package:core/src/blocs/github_search_bloc/github_search_event.dart';
import 'package:core/src/models/model.dart';
import 'package:core/src/repositories/github_respository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

import 'github_search_state.dart';


class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final GithubRepository githubRepository;

  GithubSearchBloc({@required this.githubRepository});

  @override
  Stream<GithubSearchState> transformEvents(
      Stream<GithubSearchEvent> events,
      Stream<GithubSearchState> Function(GithubSearchEvent event) next,
      ) {
    return (events as Observable<GithubSearchEvent>)
        .debounceTime(
      Duration(milliseconds: 300),
    )
        .switchMap(next);
  }

  @override
  GithubSearchState get initialState => SearchStateEmpty();

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is TextChanged) {
      String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          await Future<void>.delayed(Duration(seconds: 2));
          final results = await githubRepository.search(searchTerm);
          yield SearchStateSuccess(results.items);
        } catch (error) {
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('something went wrong');
        }
      }
    }
  }
}