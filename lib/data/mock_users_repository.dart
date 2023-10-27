import 'package:architecture/domain/failure/get_user_failure.dart';
import 'package:architecture/domain/failure/update_user_failure.dart';
import 'package:architecture/domain/failure/users_list_failure.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/entites/user.dart';
import 'package:dartz/dartz.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right(
        [
          const User(
            id: 123,
            name: 'name',
            username: 'username',
            email: 'email',
            phone: 'phone',
            website: 'website',
          ),
        ],
      );

  @override
  Future<Either<UpdateUserFailure, bool>> updateUser(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    return right(true);
  }

  @override
  Future<Either<GetUserFailure, User>> getUserByEmail(String email) async {
    Future.delayed(const Duration(seconds: 1));
    return right(const User.empty()
        .copywith(name: 'Usama', id: 123, email: 'usama@gmail.com'));
  }
}
