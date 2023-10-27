import 'package:architecture/domain/failure/get_user_failure.dart';
import 'package:architecture/domain/failure/update_user_failure.dart';
import 'package:architecture/domain/failure/users_list_failure.dart';
import 'package:architecture/domain/entites/user.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();

  Future<Either<UpdateUserFailure, bool>> updateUser(User user);

  Future<Either<GetUserFailure, User>> getUserByEmail(String email);
}
