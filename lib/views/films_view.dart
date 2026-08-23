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
        // Scaffold: Provides the standard Material Design layout structure for this screen.
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text('Ghibli Viewer'),
          ),
          body: Center(
            // Builder: Creates a new context to access viewModel state inside the body.
            child: Builder(
              builder: (context) {
                // UI Logic: Renders different widgets based on current ViewModel state.
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
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
            ),
          ),
        );
      },
    );
  }
}
