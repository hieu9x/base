import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_lifecycle_manager_state.dart';

class AppLifecycleManagerCubit extends Cubit<AppLifecycleManagerState> {
  AppLifecycleManagerCubit() : super(const AppLifecycleManagerState());

  onAppLifecycleStateChange(AppLifecycleState appLifecycleState) {
    emit(state.copyWith(appLifecycleState: appLifecycleState));
    handleAppLifecycle(appLifecycleState);
  }

  handleAppLifecycle(AppLifecycleState appLifecycleState) {
    switch (appLifecycleState) {
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        HydratedBloc.storage.write('reload_tracking', true);
        break;
      case AppLifecycleState.inactive:
        break;
    }
  }
}
