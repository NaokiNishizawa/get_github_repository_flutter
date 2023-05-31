import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:src/infla/repositories_remote_data_source.dart';
import 'package:src/models/repositories_model.dart';

final repositoriesRepositoryProvider =
    Provider.autoDispose<RepositoriesRepository>(
  (ref) => RepositoriesRepositoryImpl(
    ref.watch(repositoriesRemoteDataSource),
  ),
);

abstract class RepositoriesRepository {
  Future<RepositoriesResponse?> search(String searchWord, int limit);
}

class RepositoriesRepositoryImpl extends RepositoriesRepository {
  RepositoriesRepositoryImpl(this.dataSource);

  final RepositoriesRemoteDataSource dataSource;
  final _logger = Logger();

  @override
  Future<RepositoriesResponse?> search(String searchWord, int limit) async {
    _logger.d('RepositoriesRepositoryImpl search');

    return await dataSource.searchRepository(searchWord, limit);
  }
}
