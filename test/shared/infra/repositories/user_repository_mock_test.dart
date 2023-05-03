import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/infra/repositories/user_repository_mock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var user = UserModel(
    id: '0',
    name: 'Vitor Soller',
    email: 'gabriel.godoybz@hotmail.com',
    password: 'Teste123!',
    state: StateEnum.APPROVED,
  );

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - createUser', () {
    test('should return a user', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      var response = await repository.createUser(user);
      expect(response.fold(id, id), isA<User>());
    });
  });

  group('[TEST] - deleteUser', () {
    test('should return a user', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      var lenthBefore = repository.users.length;
      var response = await repository.deleteUser('0');
      var lenthAfter = repository.users.length;
      expect(response.fold(id, id), isA<User>());
      expect(lenthAfter, lenthBefore - 1);
    });

    test('should return NoItemsFound', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      try {
        await repository.deleteUser('0');
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });

  group('[TEST] - getAllUsers', () {
    UserRepositoryMock repository = UserRepositoryMock();

    test('should return a list of users', () async {
      var response = await repository.getAllUsers();
      expect(response.fold(id, id), isA<List<User>>());
    });

    test('should return EmptyList', () async {
      repository.users = [];
      repository.getAllUsers();
      try {
        await repository.getAllUsers();
      } catch (e) {
        expect(e, isA<EmptyList>());
      }
    });
  });

  group('[TEST] - getUser', () {
    test('should return a user', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      var response = await repository.getUser('0');
      expect(response.fold(id, id), isA<User>());
    });

    test('should return NoItemsFound', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      try {
        await repository.getUser('0');
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });

  group('[TEST] - updateUser', () {
    test('should return a user', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      var response = await repository.updateUser(user);
      expect(response.fold(id, id), isA<User>());
    });

    test('should return NoItemsFound', () async {
      UserRepositoryMock repository = UserRepositoryMock();

      try {
        await repository.updateUser(user);
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });
}
