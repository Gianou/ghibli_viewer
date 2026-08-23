import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/films_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final service = GhibliApiService();

        return FilmsViewModel(service);
      },
      child: MaterialApp(
        title: "Ghibli Viewer",

        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text('Ghibli Viewer'),
          ),
          body: Center(child: FilmsView()),
        ),
      ),
    );
  }
}
