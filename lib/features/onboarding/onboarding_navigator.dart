import 'package:architecture/features/home_master/home_master_navigator.dart';
import 'package:flutter/material.dart';
import 'package:architecture/main.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_page.dart';

class OnboardingNavigator with HomeMasterRoute {
  OnboardingNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding(OnboardingInitialParams initialParams) {
    navigator.push(
      context,
      OnboardingPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
