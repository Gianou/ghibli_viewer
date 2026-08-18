import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models.dart/film_model.dart';

class FilmTitle extends StatelessWidget {
  final Film film;

  const FilmTitle({super.key, required this.film});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              film.image,
              width: 170,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            film.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 234, 24, 24),
            ),
          ),
        ],
      ),
    );
  }
}
