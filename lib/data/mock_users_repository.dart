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
}
