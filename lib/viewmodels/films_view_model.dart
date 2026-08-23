import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/film_model.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';

class FilmsViewModel extends ChangeNotifier {
  GhibliApiService service;
  List<Film>? films;
  bool isLoading = false;
  String? errorMessage;

  FilmsViewModel(this.service);

  Future<void> fetchFilms() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      films = await service.getFilms();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
