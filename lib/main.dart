import 'package:architecture/data/insecure_local_storage_repositort.dart';
import 'package:architecture/data/mock_auth_repository.dart';
import 'package:architecture/data/mock_users_repository.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:architecture/domain/repositories/local_storage_repository.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/stores/theme_store.dart';
import 'package:architecture/domain/stores/user_store.dart';
import 'package:architecture/domain/use_cases/check_for_existing_user_use_case.dart';
import 'package:architecture/domain/use_cases/get_theme_use_case.dart';
import 'package:architecture/domain/use_cases/social_login_use_case.dart';
import 'package:architecture/domain/use_cases/update_theme_use_case.dart';
import 'package:architecture/features/home_master/home_master_cubit.dart';
import 'package:architecture/features/home_master/home_master_initial_params.dart';
import 'package:architecture/features/user_details/user_details_cubit.dart';
import 'package:architecture/features/user_details/user_details_initial_params.dart';
import 'package:architecture/features/users_list/users_list_initial_params.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'package:architecture/network/network_repository.dart';
import 'package:architecture/features/home_master/home_master_navigator.dart';
import 'package:architecture/features/onboarding/onboarding_cubit.dart';
import 'package:architecture/features/onboarding/onboarding_initial_params.dart';
import 'package:architecture/features/onboarding/onboarding_navigator.dart';
import 'package:architecture/features/onboarding/onboarding_page.dart';
import 'package:architecture/features/users_list/users_list_navigator.dart';
import 'package:architecture/features/users_list/users_list_cubit.dart';
import 'package:architecture/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(MockUsersRepository());
  getIt.registerSingleton<AuthRepository>(MockAuthRepository());
  getIt.registerSingleton<LocalStorageRepository>(
      InsecureLocalStorageRepository());

  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerSingleton<HomeMasterNavigator>(HomeMasterNavigator());
  getIt.registerSingleton<OnboardingNavigator>(OnboardingNavigator(getIt()));

  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerSingleton<ThemeStore>(ThemeStore());

  getIt.registerSingleton<GetThemeUseCase>(
    GetThemeUseCase(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<UpdateThemeUsecase>(
    UpdateThemeUsecase(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<CheckForExistingUserUseCase>(
    CheckForExistingUserUseCase(
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<SocialLoginUseCase>(
    SocialLoginUseCase(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactoryParam<HomeMasterCubit, HomeMasterInitialParams, dynamic>(
    (param1, _) => HomeMasterCubit(
      param1,
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactoryParam<UsersListCubit, UserListInitialParams, dynamic>(
    (param1, _) => UsersListCubit(
      param1,
      getIt(),
      getIt(),
    )..fetchUsers(),
  );

  getIt.registerFactoryParam<UserDetailsCubit, UserDetailsInitialParams,
      dynamic>(
    (param1, _) => UserDetailsCubit(
      param1,
    ),
  );

  getIt.registerFactoryParam<OnboardingCubit, OnboardingInitialParams, dynamic>(
    (param1, _) => OnboardingCubit(
      param1,
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: getIt<ThemeStore>(),
        builder: (context, state) {
          state as bool;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state ? darkTheme : lightTheme,
            home: OnboardingPage(
                cubit: getIt(param1: const OnboardingInitialParams())),
          );
        });
  }
}
