import 'package:ghibli_viewer/models/ghibli_api_service.dart';
import 'package:ghibli_viewer/viewmodels/films_view_model.dart';
import 'package:ghibli_viewer/views/app_shell.dart';
import 'package:ghibli_viewer/views/films/films_view.dart';
import 'package:ghibli_viewer/views/user/user_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => ChangeNotifierProvider(
        create: (context) => FilmsViewModel(GhibliApiService()),
        child: AppShell(child: child),
      ),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const FilmsView(),
        ),
        GoRoute(
          path: '/user',
          builder: (context, state) => const UserView(),
        ),
      ],
    ),
  ],
);
