import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/films_view.dart';
import 'package:provider/provider.dart';

// Main function, starting point of the app
void main() {
  runApp(const MainApp());
}

// Root Widget,
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider used for injecting dependencies into the Widget tree. ViewModels and Services are instantiated here
    return ChangeNotifierProvider(
      create: (context) {
        final service = GhibliApiService();

        return FilmsViewModel(service);
      },
      child: MaterialApp(
        title: "Ghibli Viewer",
        home: FilmsView(),
      ),
    );
  }
}
