import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class IGetAllUsersUsecase {
  Future<Either<Failure, List<User>>> call();
}

class GetAllUsersUsecase implements IGetAllUsersUsecase {
  final IUserRepository repository;

  GetAllUsersUsecase(this.repository);

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getAllUsers();
  }
}
