import 'package:mobx/mobx.dart';

import '../../../../../../shared/domain/usecases/delete_user_usecase.dart';
import '../ui/states/delete_user_state.dart';

part 'delete_user_controller.g.dart';

class DeleteUserController = DeleteUserControllerBase
    with _$DeleteUserController;

abstract class DeleteUserControllerBase with Store {
  final IDeleteUserUsecase _deleteUserUsecase;

  DeleteUserControllerBase(this._deleteUserUsecase);

  @observable
  String userId = '';

  @observable
  DeleteUserState state = const StartDeleteState();

  @action
  setUserId(String id) => userId = id;

  @action
  setPageState(DeleteUserState value) => state = value;

  @action
  Future<void> deleteUser() async {
    setPageState(const LoadingDeleteState());
    var result = await _deleteUserUsecase(userId);
    setPageState(
        result.fold((l) => ErrorDeleteState(l), (r) => SuccessDeleteState(r)));
  }
}
