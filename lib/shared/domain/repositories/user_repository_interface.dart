import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/user.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, User>> createUser(UserModel user);
  Future<Either<Failure, User>> deleteUser(String id);
  Future<Either<Failure, User>> updateUser(UserModel userToUpdate);
}
