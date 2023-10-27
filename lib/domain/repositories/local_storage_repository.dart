import 'package:architecture/domain/failure/get_local_storage_failure.dart';
import 'package:architecture/domain/failure/set_local_storage_failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalStorageRepository {
  Future<Either<SetLocalStorageFailure, bool>> set(String key, String value);

  Future<Either<GetLocalStorageFailure, String>> get(String key);
}
