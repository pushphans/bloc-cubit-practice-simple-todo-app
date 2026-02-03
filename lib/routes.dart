import 'package:bloc_cubit_practice_simple_todo_app/features/home/presentation/screens/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [GoRoute(path: "/home", builder: (context, state) => HomePage())],
);
