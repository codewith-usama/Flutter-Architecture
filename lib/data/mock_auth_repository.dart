import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<Either<LoginFailure, User>> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(
      const User.empty()
          .copywith(name: 'Usama', id: 123, email: 'usama@gmail.com'),
    );
  }
}
