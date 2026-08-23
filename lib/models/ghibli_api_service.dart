import 'dart:convert';
import 'dart:io';

import 'package:ghibli_viewer/models/film_model.dart';
import 'package:http/http.dart' as http;

// Service Layer: Handles external API communication. Keeps logic separate from UI and ViewModel.
class GhibliApiService {
  // Fetches raw data from the API and converts it into a list of Film models.
  Future<List<Film>> getFilms() async {
    // 1. Define the endpoint URL.
    final uri = Uri.https('ghibliapi.vercel.app', '/films');

    // 2. Execute the HTTP GET request.
    final response = await http.get(uri);

    // 3. Validate response status. Throw exception if not 200 OK.
    if (response.statusCode != 200) {
      throw HttpException('Failed to fetch films: HTTP ${response.statusCode}');
    }

    // 4. Decode JSON string into a Dart List of dynamic maps.
    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    // 5. Transform each JSON map into a strongly-typed Film object.
    return jsonList
        .map((jsonItem) => Film.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
