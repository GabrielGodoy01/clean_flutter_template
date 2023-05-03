import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/infra/external/http/user_datasource_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/user_repository_interface.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/errors/errors.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../models/user_model.dart';

class UserRepositoryHttp implements IUserRepository {
  final IUserDatasource datasource;

  UserRepositoryHttp({required this.datasource});

  @override
  Future<Either<Failure, User>> createUser(UserModel userToCreate) async {
    User user;
    try {
      user = await datasource.createUser(userToCreate);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data['message']));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, User>> deleteUser(String id) async {
    User user;
    try {
      user = await datasource.deleteUser(id);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data['message']));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    List<User> users;
    try {
      users = await datasource.getAllUsers();
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data['message']));
    }
    return users.isEmpty ? left(EmptyList()) : right(users);
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    User user;
    try {
      user = await datasource.getUser(id);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data['message']));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, User>> updateUser(UserModel userToUpdate) async {
    User user;
    try {
      user = await datasource.updateUser(userToUpdate);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data['message']));
    }
    return right(user);
  }
}
