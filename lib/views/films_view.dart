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
        } else if (viewModel.filmsToDisplay != null) {
          final films = viewModel.filmsToDisplay;

          return ListView.builder(
            itemCount: films?.length,
            itemBuilder: (context, index) {
              final film = films![index];
              return Center(
                child: SizedBox(width: 200, child: FilmCard(film: film)),
              );
            },
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
