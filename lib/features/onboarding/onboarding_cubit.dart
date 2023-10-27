import 'package:architecture/domain/use_cases/check_for_existing_user_use_case.dart';
import 'package:architecture/domain/use_cases/social_login_use_case.dart';
import 'package:architecture/features/home_master/home_master_initial_params.dart';
import 'package:architecture/features/onboarding/onboarding_navigator.dart';
import 'package:architecture/features/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_initial_params.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;
  final SocialLoginUseCase _socialLoginUseCase;
  final OnboardingNavigator navigator;
  final CheckForExistingUserUseCase _checkForExistingUserUseCase;

  OnboardingCubit(
    this.initialParams,
    this._socialLoginUseCase,
    this.navigator,
    this._checkForExistingUserUseCase,
  ) : super(OnboardingState.initial(initialParams: initialParams));

  onInit() {
    emit(state.copyWith(isLoading: true));

    _checkForExistingUserUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
            },
            (r) {
              emit(state.copyWith(isLoading: false));

              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }

  void onTapGoogleSigin() {
    emit(state.copyWith(isLoading: true));
    _socialLoginUseCase.execute().then(
          (value) => value.fold(
            (l) => null,
            (user) {
              emit(state.copyWith(isLoading: false));

              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }
}
