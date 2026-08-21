import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/film_model.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';

class FilmsViewModel extends ChangeNotifier {
  GhibliApiService service;
  Film? filmToDispaly;
  List<Film>? filmsToDispaly;
  bool isLoading = false;

  FilmsViewModel(this.service);

  Future<void> fetchFilm() async {
    isLoading = true;
    notifyListeners();

    filmToDispaly = await service.getFilm();
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchFilms() async {
    isLoading = true;
    notifyListeners();

    filmsToDispaly = await service.getFilms();
    isLoading = false;
    notifyListeners();
  }
}
