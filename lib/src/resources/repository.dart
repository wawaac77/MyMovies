import 'dart:async';
import 'package:my_movies/src/models/category_detail_model.dart';
import 'package:my_movies/src/models/category_result_model.dart';

import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);

  Future<ResultModel> fetchAllPacks() => moviesApiProvider.fetchPackResult();

  Future<PackDetailModel> fetchPacksDetail() => moviesApiProvider.fetchPacksDetail();

}
