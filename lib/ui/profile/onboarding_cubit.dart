import 'package:architecture/domain/use_cases/social_login_use_case.dart';
import 'package:architecture/ui/home_master/home_master_initial_params.dart';
import 'package:architecture/ui/profile/onboarding_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;
  final SocialLoginUseCase _socialLoginUseCase;
  final OnboardingNavigator navigator;

  OnboardingCubit(
    this.initialParams,
    this._socialLoginUseCase,
    this.navigator,
  ) : super(OnboardingState.initial(initialParams: initialParams));

  void onTapGoogleSigin() {
    emit(state.copyWith(isLoading: true));
    _socialLoginUseCase.execute().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              emit(state.copyWith(isLoading: false));

              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }
}
