import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:src/models/repositories_model.dart';
import 'package:src/repositories/repositoriesRepository.dart';

final repositoriesViewModelProvider = StateNotifierProvider.autoDispose<
    RepositoriesViewModel, AsyncValue<RepositoriesResponse?>>(
  (ref) => RepositoriesViewModel(
    ref.watch(repositoriesRepositoryProvider),
  ),
);

class RepositoriesViewModel
    extends StateNotifier<AsyncValue<RepositoriesResponse?>> {
  RepositoriesViewModel(this._repository) : super(const AsyncValue.data(null));

  final RepositoriesRepository _repository;
  final _logger = Logger();
  int unitRepository = 30;
  int limit = 30;

  Future<void> search(String searchWord) async {
    _logger.d('RepositoriesViewModelImpl search');

    state = const AsyncValue.loading();
    await _execute(searchWord, limit);
  }

  Future<void> loadNext(String searchWord) async {
    limit += unitRepository;
    if (limit >= 100) {
      limit = 100;
    }
    await _execute(searchWord, limit);
  }

  Future<void> _execute(String searchWord, int limit) async {
    final result = await _repository.search(searchWord, limit);
    if (result != null) {
      _logger.d('search success');
      state = AsyncValue.data(result);
    } else {
      // Error
      _logger.e('RepositoriesViewModelImpl Error');
      state = AsyncValue.error('search method error', StackTrace.current);
    }
  }
}
