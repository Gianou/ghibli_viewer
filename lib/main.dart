import 'package:flutter/material.dart';
import 'package:ghibli_viewer/routing/router.dart';

// Entry point: Starts the Flutter engine and renders the root widget.
void main() {
  runApp(const MainApp());
}

// Root Widget: Configures app structure and routing.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp: Provides Material Design structure, routing, and theme configuration.
    return MaterialApp.router(
      title: "Ghibli Viewer",

      // routerConfig: Configures routing.
      routerConfig: router(),
    );
  }
}
