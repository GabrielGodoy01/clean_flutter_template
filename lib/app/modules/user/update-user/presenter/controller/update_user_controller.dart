import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/domain/usecases/update_user_usecase.dart';
import '../ui/states/update_user_state.dart';

part 'update_user_controller.g.dart';

class UpdateUserController = UpdateUserControllerBase
    with _$UpdateUserController;

abstract class UpdateUserControllerBase with Store {
  final IUpdateUserUsecase _updateUserUsecase;

  UpdateUserControllerBase(this._updateUserUsecase);

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  String userPassword = '';

  @observable
  String userId = '';

  @observable
  UpdateUserState state = const StartUpdateState();

  @action
  setUserName(String name) => userName = name;

  @action
  setUserEmail(String email) => userEmail = email;

  @action
  setUserPassword(String password) => userPassword = password;

  @action
  setUserId(String id) => userId = id;

  @action
  setPageState(UpdateUserState value) => state = value;

  @action
  Future<void> updateUser() async {
    setPageState(const LoadingUpdateState());
    var result =
        await _updateUserUsecase(userName, userEmail, userPassword, userId);
    setPageState(
        result.fold((l) => ErrorUpdateState(l), (r) => SuccessUpdateState(r)));
  }

  @action
  String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    return null;
  }

  @action
  String? validateUserEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (!value.contains('@')) {
      return S.current.fieldInvalidEmail;
    }
    return null;
  }

  @action
  String? validateUserPassword(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (value.length < 6) {
      return S.current.fieldMinLength;
    }
    return null;
  }
}
