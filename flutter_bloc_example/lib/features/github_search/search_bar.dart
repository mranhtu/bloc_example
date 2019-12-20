import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  GithubSearchBloc _githubSearchBloc;

  @override
  void initState() {
    _githubSearchBloc = BlocProvider.of<GithubSearchBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void onClearTapped() {
    _textController.text = '';
    _githubSearchBloc.add(TextChanged(text: ''));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: onClearTapped,
        ),
        border: InputBorder.none,
        hintText: 'Search',
      ),
      onChanged: (String value) {
        _githubSearchBloc.add(TextChanged(text: value));
      },
    );
  }
}
