import 'package:architecture/data/mock_auth_repository.dart';
import 'package:architecture/data/rest_api_users_repository.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/use_cases/social_login_use_case.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'package:architecture/network/network_repository.dart';
import 'package:architecture/ui/home_master/home_master_cubit.dart';
import 'package:architecture/ui/home_master/home_master_initial_params.dart';
import 'package:architecture/ui/home_master/home_master_navigator.dart';
import 'package:architecture/ui/profile/onboarding_cubit.dart';
import 'package:architecture/ui/profile/onboarding_initial_params.dart';
import 'package:architecture/ui/profile/onboarding_navigator.dart';
import 'package:architecture/ui/profile/onboarding_page.dart';
import 'package:architecture/ui/user_details/user_details_cubit.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_navigator.dart';
import 'package:architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository(getIt()));
  getIt.registerSingleton<AuthRepository>(MockAuthRepository());

  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerSingleton<HomeMasterNavigator>(HomeMasterNavigator());
  getIt.registerSingleton<OnboardingNavigator>(OnboardingNavigator(getIt()));

  getIt.registerSingleton<SocialLoginUseCase>(SocialLoginUseCase(getIt()));

  getIt.registerFactoryParam<HomeMasterCubit, HomeMasterInitialParams, dynamic>(
    (param1, _) => HomeMasterCubit(param1),
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
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: const Color(0XFF2F384C)),
      ),
      home:
          OnboardingPage(cubit: getIt(param1: const OnboardingInitialParams())),
    );
  }
}
