import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/infraestructure/models/models.dart';

final homeMenuItems = <MenuModel>[
  MenuModel(
      path: '/${AppParameter.cubit}',
      title: 'Cubit',
      subTitle: 'Gestor de estado cubit'),
  MenuModel(
      path: '/${AppParameter.bloc}',
      title: 'Bloc',
      subTitle: 'Gestor de estado bloc'),
  MenuModel(
      path: '/${AppParameter.riverpod}',
      title: 'Riverpod',
      subTitle: 'Gestor de estado Riverpod'),
  MenuModel(
      path: '/${AppParameter.provider}',
      title: 'Provider',
      subTitle: 'Gestor de estado Provider'),
  MenuModel(
      path: '/${AppParameter.traditionalForm}',
      title: 'Traditional form',
      subTitle: 'Diseño tradicional de formulario'),
];
