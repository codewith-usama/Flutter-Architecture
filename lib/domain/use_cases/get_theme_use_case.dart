import 'package:architecture/domain/failure/get_theme_failure.dart';
import 'package:architecture/domain/repositories/local_storage_repository.dart';
import 'package:architecture/domain/stores/theme_store.dart';
import 'package:architecture/global.dart';
import 'package:dartz/dartz.dart';

class GetThemeUseCase {
  final LocalStorageRepository _localStorageRepository;

  final ThemeStore _themeStore;

  GetThemeUseCase(
    this._localStorageRepository,
    this._themeStore,
  );

  Future<Either<GetThemeFailure, Unit>> execute() =>
      _localStorageRepository.getBool(GlobalConstant.themeKey).then(
            (value) => value.fold(
              (l) => left(GetThemeFailure(error: l.error)),
              (isDarkTheme) {
                _themeStore.setTheme(isDarkTheme);
                return right(unit);
              },
            ),
          );
}
