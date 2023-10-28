import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeStore extends Cubit<bool> {
  ThemeStore() : super(false);

  setTheme(bool isDarkTheme) => emit(isDarkTheme);
}
