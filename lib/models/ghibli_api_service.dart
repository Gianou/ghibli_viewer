import 'dart:convert';
import 'dart:io';

import 'package:ghibli_viewer/models/film_model.dart';
import 'package:http/http.dart';

class GhibliApiService {
  Future<Film> getFilm() async {
    final uri = Uri.https(
      'ghibliapi.vercel.app',
      '/films/ea660b10-85c4-4ae3-8a5f-41cea3648e3e',
    );
    final response = await get(uri);
    print(response.body);

    if (response.statusCode != 200) {
      throw const HttpException('Failed to update resource');
    }

    return Film.fromJson(jsonDecode(response.body) as Map<String, Object?>);
  }

  Future<List<Film>> getFilms() async {
    final uri = Uri.https('ghibliapi.vercel.app', '/films');
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw const HttpException('Failed to update resource');
    }

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((jsonItem) => Film.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
