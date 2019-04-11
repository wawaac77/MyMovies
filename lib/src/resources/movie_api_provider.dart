import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:my_movies/src/models/category_detail_model.dart';
import 'package:my_movies/src/models/category_result_model.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  final _clubsimBaseUrl = "https://uat.clubsim.com.hk";

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

  Future<ResultModel> fetchPackResult() async {
    String lang = 'eng';
    final response = await client.get("$_clubsimBaseUrl/clsmw/api?action=240&platform=ios&lang=$lang&link=true");

    if (response.statusCode == 200) {
      return ResultModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

  Future<PackDetailModel> fetchPacksDetail() async {
    String lang = 'eng';
    String cat = 'game';

    final response = await client.get("$_clubsimBaseUrl/clsmw/api?action=230&platform=ios&lang=$lang&link=true&cat=$cat");

    if (response.statusCode == 200) {
      return PackDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pack detail');
    }
  }
}
