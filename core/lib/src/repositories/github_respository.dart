import 'dart:async';

import 'package:core/src/models/model.dart';

import 'github_cache.dart';
import 'github_client.dart';


class GithubRepository {
  final GithubCache cache;
  final GithubClient client;

  GithubRepository(this.cache, this.client);

  Future<SearchResult> search(String term) async {
    if (cache.contains(term)) {
      return cache.get(term);
    } else {
      final result = await client.search(term);
      cache.set(term, result);
      return result;
    }
  }
}