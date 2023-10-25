import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure, User>> login();
}
