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
];
