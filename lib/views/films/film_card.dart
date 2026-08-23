import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/film_model.dart';
import 'package:ghibli_viewer/views/films/film_details.dart';
import 'package:ghibli_viewer/views/films/film_title.dart';

class FilmCard extends StatefulWidget {
  final Film film;
  const FilmCard({super.key, required this.film});

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDetails = !showDetails;
        });
      },
      child: Container(
        width: 200,
        height: 320,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: showDetails
            ? FilmDetails(film: widget.film)
            : FilmTitle(film: widget.film),
      ),
    );
  }
}
