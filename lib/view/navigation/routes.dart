import 'package:bored/view/favorites/favorites_screen.dart';
import 'package:bored/view/home/home_screen.dart';
import 'package:bored/view/navigation/scaffold_with_navbar.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) {
      return ScaffoldWithNavbar(child: child);
    },
    routes: [
      GoRoute(
          path: "/",
          pageBuilder: (context, state) {
            return NoTransitionPage(
                child: HomeScreen());
          }),
      GoRoute(
          path: "/favorites",
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: FavoritesScreen());
          })
    ],
  )
]);
