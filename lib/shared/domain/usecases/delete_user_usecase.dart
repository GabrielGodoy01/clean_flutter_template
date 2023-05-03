import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class IDeleteUserUsecase {
  Future<Either<Failure, User>> call(String id);
}

class DeleteUserUsecase implements IDeleteUserUsecase {
  final IUserRepository repository;

  DeleteUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(String id) async {
    return await repository.deleteUser(id);
  }
}
