import 'package:mobx/mobx.dart';

import '../../../../../../shared/domain/usecases/get_all_users_usecase.dart';
import '../ui/state/get_all_users_state.dart';

part 'get_all_users_controller.g.dart';

class GetAllUsersController = GetAllUsersControllerBase
    with _$GetAllUsersController;

abstract class GetAllUsersControllerBase with Store {
  final IGetAllUsersUsecase _getAllUsersUsecase;

  GetAllUsersControllerBase(this._getAllUsersUsecase) {
    getAllUsers();
  }

  @observable
  GetAllUsersState state = const StartGetAllState();

  @action
  setPageState(GetAllUsersState value) => state = value;

  @action
  Future<void> getAllUsers() async {
    setPageState(const LoadingGetAllState());
    var result = await _getAllUsersUsecase();
    setPageState(
        result.fold((l) => ErrorGetAllState(l), (r) => SuccessGetAllState(r)));
  }
}
