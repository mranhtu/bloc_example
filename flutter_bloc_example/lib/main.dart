import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/github_search/search_form_screen.dart';

void main() {
  runApp(
    RepositoryProvider(
        create: (_) => GithubRepository(GithubCache(), GithubClient()),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GithubSearchBloc>(
          create: (context) => GithubSearchBloc(
            githubRepository: RepositoryProvider.of<GithubRepository>(context),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Example Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchScreen(),
      ),
    );
  }
}
