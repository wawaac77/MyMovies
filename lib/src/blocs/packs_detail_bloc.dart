import 'package:my_movies/src/models/category_detail_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PacksDetailBloc {
  final _repository = Repository();
  final _packsDetailFetcher = PublishSubject<PackDetailModel>();

  Observable<PackDetailModel> get packDetail => _packsDetailFetcher.stream;

  fetchPackDetail() async {
    PackDetailModel packDetailModel = await _repository.fetchPacksDetail();
    _packsDetailFetcher.sink.add(packDetailModel);
  }

  dispose() {
    _packsDetailFetcher.close();
  }
}

final packDetailBloc = PacksDetailBloc();
