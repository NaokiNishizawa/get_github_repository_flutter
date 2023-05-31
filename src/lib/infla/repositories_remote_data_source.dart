import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:src/infla/api_client.dart';
import 'package:src/models/repositories_model.dart';

final repositoriesRemoteDataSource =
    Provider.autoDispose<RepositoriesRemoteDataSource>(
  (ref) => RepositoriesRemoteDataSourceImpl(
    ref.watch(apiClientProvider),
  ),
);

abstract class RepositoriesRemoteDataSource {
  Future<RepositoriesResponse?> searchRepository(String searchWord, int limit);
}

class RepositoriesRemoteDataSourceImpl extends RepositoriesRemoteDataSource {
  RepositoriesRemoteDataSourceImpl(this.client);
  final ApiClient client;
  final _logger = Logger();

  Future<RepositoriesResponse?> searchRepository(
      String searchWord, int limit) async {
    _logger.d('RepositoriesRemoteDataSourceImpl searchRepository');
    _logger.d('searchWord : $searchWord, limit : $limit');

    final query = """query {
    search(type: REPOSITORY, query: "$searchWord", last: $limit) {
    repositoryCount
    nodes {
      ... on Repository {
        id
        url
        name
        createdAt
      }
    }
  }
}
  """;
    final result = await client.execute(query);

    if (result.exception != null) {
      return null;
    }
    return RepositoriesResponse.fromJson(
        jsonDecode(result.data?['search']) as Map<String, dynamic>);
  }
}
