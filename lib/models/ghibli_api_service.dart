import 'dart:convert';
import 'dart:io';

import 'package:ghibli_viewer/models/film_model.dart';
import 'package:http/http.dart';

class GhibliApiService {
  Future<List<Film>> getFilms() async {
    final uri = Uri.https('ghibliapi.vercel.app', '/films');
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw HttpException('Failed to fetch films: HTTP ${response.statusCode}');
    }

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((jsonItem) => Film.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
