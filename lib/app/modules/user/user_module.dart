import 'package:clean_flutter_template/app/modules/user/update-user/update_user_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/datasource/external/http/user_datasource.dart';
import '../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../shared/environment/environment_config.dart';
import '../../../shared/helpers/services/dio_http_request.dart';
import '../../../shared/helpers/services/dio_options.dart';
import '../../../shared/helpers/services/http_request_interface.dart';
import '../../../shared/infra/external/http/user_datasource_interface.dart';
import 'create-user/create_user_module.dart';
import 'delete-user/delete_user_module.dart';
import 'get-all-users/get_all_users_module.dart';
import 'get-user/get_user_module.dart';
import 'home/presenter/ui/pages/home_page.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(userOptions)),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>()), export: true),
        Bind<IUserDatasource>((i) => UserDatasource(i<IHttpRequest>()),
            export: true),
        Bind<IUserRepository>((i) {
          return EnvironmentConfig.getUserRepo();
        }, export: true),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute(
          '/create-user',
          module: CreateUserModule(),
        ),
        ModuleRoute(
          '/get-user',
          module: GetUserModule(),
        ),
        ModuleRoute(
          '/update-user',
          module: UpdateUserModule(),
        ),
        ModuleRoute(
          '/delete-user',
          module: DeleteUserModule(),
        ),
        ModuleRoute(
          '/get-all-users',
          module: GetAllUsersModule(),
        ),
      ];
}
