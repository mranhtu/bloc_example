import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchFormView extends StatelessWidget {
  final List<SearchResultItem> items;

  const SearchFormView({this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: items?.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(items[index].owner.avatarUrl),
              ),
              title: Text(items[index].fullName),
              onTap: () async {
                if (await canLaunch(items[index].htmlUrl)) {
                  await launch(items[index].htmlUrl);
                }
              },
            );
          }),
    );
  }
}
