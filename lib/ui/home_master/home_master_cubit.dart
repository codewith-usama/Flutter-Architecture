import 'package:architecture/domain/stores/user_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_master_initial_params.dart';
import 'home_master_state.dart';

class HomeMasterCubit extends Cubit<HomeMasterState> {
  final HomeMasterInitialParams initialParams;
  final UserStore userStore;

  HomeMasterCubit(
    this.initialParams,
    this.userStore,
  ) : super(
          HomeMasterState.initial(initialParams: initialParams),
        );

  onInt() => emit(state.copyWith(user: userStore.state));
}
