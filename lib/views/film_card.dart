import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models.dart/film_model.dart';
import 'package:ghibli_viewer/views/film_details.dart';
import 'package:ghibli_viewer/views/film_title.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  const FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 320,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: FilmTitle(film: film),
    );
  }
}
