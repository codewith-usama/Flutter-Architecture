import 'package:architecture/domain/failure/update_theme_failure.dart';
import 'package:architecture/domain/repositories/local_storage_repository.dart';
import 'package:architecture/domain/stores/theme_store.dart';
import 'package:architecture/global.dart';
import 'package:dartz/dartz.dart';

class UpdateThemeUsecase {
  final ThemeStore _themeStore;
  final LocalStorageRepository _localStorageRepository;

  UpdateThemeUsecase(
    this._themeStore,
    this._localStorageRepository,
  );

  Future<Either<UpdateThemeFailure, bool>> execute(bool isDarkTheme) {
    _themeStore.setTheme(isDarkTheme);

    return _localStorageRepository
        .setBool(GlobalConstant.themeKey, isDarkTheme)
        .then(
          (value) => value.fold(
            (l) => left(UpdateThemeFailure(error: l.error)),
            (r) => right(true),
          ),
        );
  }
}
