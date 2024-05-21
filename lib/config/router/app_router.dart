import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  GoRoute(
    path: '/${AppParameter.riverpod}',
    builder: (context, state) => const ProviderScope(child: RiverpodScreen()),
  ),
  GoRoute(
    path: '/${AppParameter.provider}',
    builder: (context, state) => const ProviderScreen(),
  ),
  GoRoute(
    path: '/${AppParameter.traditionalForm}',
    builder: (context, state) => const TraditionalForm(),
  ),
  GoRoute(
    path: '/${AppParameter.stateForm}',
    builder: (context, state) => const StateGestureForm(),
  ),
  GoRoute(
    path: '/${AppParameter.customStateForm}',
    builder: (context, state) => const CustomStateGestureForm(),
  ),
  GoRoute(
    path: '/${AppParameter.customStateFormAuto}',
    builder: (context, state) => const CustomStateGestureFormAuto(),
  ),
]);

class AppParameter {
  static String home = 'home';
  static String cubit = 'cubit';
  static String bloc = 'bloc';
  static String riverpod = 'riverpod';
  static String provider = 'provider';
  static String traditionalForm = 'traditional-form';
  static String stateForm = 'state-form';
  static String customStateForm = 'custom-state-form';
  static String customStateFormAuto = 'custom-state-form-auto';
}
