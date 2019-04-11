import 'package:my_movies/src/blocs/movie_detail_bloc_provider.dart';
import 'package:my_movies/src/models/category_result_model.dart';
import 'package:my_movies/src/models/item_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PacksBloc {
  final _repository = Repository();
  final _packsFetcher = PublishSubject<ResultModel>();

  Observable<ResultModel> get allPacks => _packsFetcher.stream;

  fetchAllPacks() async {
    ResultModel packResultModel = await _repository.fetchAllPacks();
    _packsFetcher.sink.add(packResultModel);
  }

  dispose() {
    _packsFetcher.close();
  }
}

final packsBloc = PacksBloc();
