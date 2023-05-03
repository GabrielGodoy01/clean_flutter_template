import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/controllers/get_all_users_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/ui/state/get_all_users_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_users_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_users_controller_test.mocks.dart';

@GenerateMocks([GetAllUsersUsecase])
void main() {
  late GetAllUsersController controller;
  GetAllUsersUsecase usecase = MockGetAllUsersUsecase();

  var listUsers = [
    UserModel(
      name: 'Gabriel',
      email: 'gabriel.godoybz@hotmail.com',
      password: 'Teste123!',
      state: StateEnum.REJECTED,
      id: '0',
    ),
  ];

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - deleteUser', () {
    test('should return SuccessDeleteState', () async {
      when(usecase.call()).thenAnswer((_) async => Right(listUsers));
      controller = GetAllUsersController(usecase);
      expect(controller.state, const LoadingGetAllState());
      await controller.getAllUsers();
      expect(controller.state, isA<SuccessGetAllState>());
    });

    test('should return ErrorDeleteState', () async {
      when(usecase.call())
          .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
      controller = GetAllUsersController(usecase);
      expect(controller.state, const LoadingGetAllState());
      await controller.getAllUsers();
      expect(controller.state, isA<ErrorGetAllState>());
    });

    test('setPageState', () {
      when(usecase.call()).thenAnswer((_) async => right(listUsers));
      controller = GetAllUsersController(usecase);
      controller.setPageState(const LoadingGetAllState());
      expect(controller.state, const LoadingGetAllState());
    });
  });
}
