import 'package:forms_app/presentation/screens/home/home_screen.dart';
import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/${AppParameter.cubit}',
    builder: (context, state) => const CubitScreen(),
  ),
  GoRoute(
    path: '/${AppParameter.bloc}',
    builder: (context, state) => const BlocScreen(),
  ),
]);

class AppParameter {
  static String home = 'home';
  static String cubit = 'cubit';
  static String bloc = 'bloc';
}
