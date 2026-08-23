import 'package:flutter/material.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/film_card.dart';
import 'package:provider/provider.dart';

class FilmsView extends StatelessWidget {
  const FilmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmsViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => viewModel.fetchFilms(),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        } else if (viewModel.isLoading) {
          return const CircularProgressIndicator();
        } else if (viewModel.films != null) {
          final films = viewModel.films!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16, // horizontal spacing
              runSpacing: 16, // vertical spacing between rows
              children: [
                for (final film in films)
                  SizedBox(width: 200, child: FilmCard(film: film)),
              ],
            ),
          );
        }
        return TextButton(
          onPressed: () => viewModel.fetchFilms(),
          child: const Text("Fetch Movies"),
        );
      },
    );
  }
}
