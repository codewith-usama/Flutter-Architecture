import 'package:architecture/domain/stores/theme_store.dart';
import 'package:architecture/domain/stores/user_store.dart';
import 'package:architecture/domain/use_cases/update_theme_use_case.dart';
import 'package:architecture/features/home_master/home_master_initial_params.dart';
import 'package:architecture/features/home_master/home_master_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMasterCubit extends Cubit<HomeMasterState> {
  final HomeMasterInitialParams initialParams;
  final UserStore userStore;
  final UpdateThemeUsecase _updateThemeUsecase;
  final ThemeStore _themeStore;

  HomeMasterCubit(
    this.initialParams,
    this.userStore,
    this._updateThemeUsecase,
    this._themeStore,
  ) : super(
          HomeMasterState.initial(initialParams: initialParams),
        );

  onInt() {
    emit(state.copyWith(user: userStore.state, isDarkTheme: _themeStore.state));
    _themeStore.stream.listen((event) {
      emit(state.copyWith(isDarkTheme: event));
    });
  }

  void onThemeChanged(bool value) => _updateThemeUsecase.execute(value);
}
