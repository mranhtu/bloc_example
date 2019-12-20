import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/github_search/search_bar.dart';
import 'package:flutter_bloc_example/features/github_search/search_form_view.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Github Search example"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SearchBar(),
              BlocBuilder<GithubSearchBloc, GithubSearchState>(
                builder: (context, searchState) {
                  if (searchState is SearchStateLoading) {
                    return CircularProgressIndicator();
                  }
                  if (searchState is SearchStateError) {
                    return Text(searchState.error);
                  }
                  if (searchState is SearchStateSuccess) {
                    return searchState.items.isEmpty
                        ? Text('No Results')
                        : SearchFormView(
                            items: searchState?.items,
                          );
                  }
                  return Text('Please enter a term to begin');
                },
              ),
            ],
          ),
        ));
  }
}
