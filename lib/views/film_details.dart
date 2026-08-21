import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/film_model.dart';

class FilmDetails extends StatelessWidget {
  final Film film;

  const FilmDetails({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            film.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 234, 24, 24),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'Director: ${film.director}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text('Producer: ${film.producer}'),

          const SizedBox(height: 8),

          Text('Release: ${film.releaseDate}'),

          const SizedBox(height: 16),

          Text(film.description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
