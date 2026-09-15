import 'package:flutter/material.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/film_card.dart';
import 'package:provider/provider.dart';

// View: Displays UI and reacts to ViewModel state changes.
class FilmsView extends StatelessWidget {
  const FilmsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer: Rebuilds this section whenever FilmsViewModel notifies listeners of changes.
    return Consumer<FilmsViewModel>(
      builder: (context, viewModel, child) {
        // Determine which widget to show based on state
        Widget bodyContent;

        if (viewModel.errorMessage != null) {
          bodyContent = Column(
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
          );
        } else if (viewModel.isLoading) {
          bodyContent = const CircularProgressIndicator();
        } else if (viewModel.films != null) {
          final films = viewModel.films!;
          bodyContent = ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              return Center(child: FilmCard(film: films[index]));
            },
          );
        } else {
          bodyContent = TextButton(
            onPressed: () => viewModel.fetchFilms(),
            child: const Text("Fetch Movies"),
          );
        }

        // Scaffold: Provides the standard Material Design layout structure for this screen.
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text('Ghibli Viewer'),
          ),
          body: Center(child: bodyContent),
        );
      },
    );
  }
}
