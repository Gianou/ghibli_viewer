import 'package:flutter/material.dart';
import 'package:ghibli_viewer/models/film_model.dart';
import 'package:ghibli_viewer/models/ghibli_api_service.dart';

// ViewModel: Holds UI state and business logic. Extends ChangeNotifier to alert views of updates.
class FilmsViewModel extends ChangeNotifier {
  final GhibliApiService
  service; // Dependency: The service layer for API calls.
  List<Film>? films; // State: The data displayed in the view.
  bool isLoading = false; // State: Tracks loading status for UI feedback.
  String? errorMessage; // State: Stores error messages to display to the user.

  // Constructor: Injects the service dependency.
  FilmsViewModel(this.service);

  // Action: Fetches data from the service and updates state.
  Future<void> fetchFilms() async {
    // 1. Update state for loading start.
    isLoading = true;
    errorMessage = null;
    notifyListeners(); // Triggers a UI rebuild to show the loader.

    try {
      // 2. Execute async API call.
      films = await service.getFilms();
    } catch (e) {
      // 3. Handle errors gracefully.
      errorMessage = e.toString();
    } finally {
      // 4. Reset loading state regardless of success/failure.
      isLoading = false;
      notifyListeners(); // Triggers a UI rebuild to show data or error.
    }
  }
}
