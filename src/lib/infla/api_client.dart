import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClientImpl()..init(),
);

abstract class ApiClient {
  Future<QueryResult> execute(String query);
}

/// 通信クラス　実体
class ApiClientImpl extends ApiClient {
  final _endpoint = 'https://api.github.com/graphql';
  final _accessToken = dotenv.get('ACCESS_TOKEN');
  GraphQLClient? _client;
  final _logger = Logger();

  void init() {
    final httpLink = HttpLink(
      _endpoint,
    );

    final AuthLink authLink = AuthLink(
      getToken: () => 'Bearer $_accessToken',
    );

    final Link link = authLink.concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    );
  }

  @override
  Future<QueryResult> execute(String query) async {
    if (_client != null) {
      final QueryResult result = await _client!.query(
        QueryOptions(
          document: gql(query),
        ),
      );

      if (result.exception != null) {
        for (final GraphQLError error in result.exception!.graphqlErrors) {
          _logger.e(error.message);
        }
      }

      return result;
    } else {
      return QueryResult.unexecuted;
    }
  }
}
