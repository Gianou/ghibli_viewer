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
        if (viewModel.filmsToDispaly != null) {
          final films = viewModel.filmsToDispaly;

          return ListView.builder(
            itemCount: films?.length,
            itemBuilder: (context, index) {
              final film = films![index];
              return Center(
                child: SizedBox(width: 200, child: FilmCard(film: film)),
              );
            },
          );
        } else if (viewModel.isLoading) {
          return CircularProgressIndicator();
        }
        return TextButton(
          onPressed: () => viewModel.fetchFilms(),
          child: Text("Fetch a Movie"),
        );
      },
    );
  }
}
