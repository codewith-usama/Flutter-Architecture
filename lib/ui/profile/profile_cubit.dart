import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_initial_params.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  void onInit(ProfileInitialParams initialParams) {}
}
