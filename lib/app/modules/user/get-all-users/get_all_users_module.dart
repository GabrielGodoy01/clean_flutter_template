import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/controllers/get_all_users_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/ui/pages/get_all_users_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../../shared/domain/usecases/get_all_users_usecase.dart';
import '../user_module.dart';

class GetAllUsersModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind<IGetAllUsersUsecase>(
            (i) => GetAllUsersUsecase(i<IUserRepository>())),
        Bind<GetAllUsersController>(
            (i) => GetAllUsersController(i<IGetAllUsersUsecase>())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const GetAllUsersPage(),
        ),
      ];
}
