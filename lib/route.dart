import 'package:github_graphql/presentation/screens/home.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
