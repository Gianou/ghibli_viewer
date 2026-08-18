import 'package:flutter/material.dart';
import 'package:ghibli_viewer/views/movie_title.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MovieTitle(title: "Kiki's Delivery Service"),
              MovieTitle(title: "Howl's Moving Castle"),
            ],
          ),
        ),
      ),
    );
  }
}
