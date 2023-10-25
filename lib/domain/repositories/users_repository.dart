import 'package:architecture/domain/failure/users_list_failure.dart';
import 'package:architecture/domain/entites/user.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}
