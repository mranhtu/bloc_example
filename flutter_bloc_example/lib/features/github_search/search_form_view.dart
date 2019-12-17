import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchFormView extends StatefulWidget {

  final List<SearchResultItem> items;
  SearchFormView({this.items});

  @override
  _SearchFormViewState createState() => _SearchFormViewState();
}

class _SearchFormViewState extends State<SearchFormView> {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget?.items?.length,
          itemBuilder: (BuildContext context, int index){

            return ListTile(
              leading: CircleAvatar(
                child: Image.network(widget?.items[index].owner.avatarUrl),
              ),
              title: Text(widget?.items[index].fullName),
              onTap: () async {
                if (await canLaunch(widget?.items[index].htmlUrl)) {
                  await launch(widget?.items[index].htmlUrl);
                }
              },
            );
          }
      ),
    );
  }
}
