import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/films_view.dart';
import 'package:provider/provider.dart';

// Entry point: Starts the Flutter engine and renders the root widget.
void main() {
  runApp(const MainApp());
}

// Root Widget: Configures Dependency Injection (MVVM) and app structure.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider: Instantiates ViewModel & Service here to inject them into the widget tree.
    return ChangeNotifierProvider(
      create: (context) => FilmsViewModel(GhibliApiService()),
      // MaterialApp: Provides Material Design structure, routing, and theme configuration.
      child: MaterialApp(
        title: "Ghibli Viewer",
        // home: The initial View (Screen) displayed on app launch.
        home: FilmsView(),
      ),
    );
  }
}
