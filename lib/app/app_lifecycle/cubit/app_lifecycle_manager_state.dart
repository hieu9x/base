part of 'app_lifecycle_manager_cubit.dart';

class AppLifecycleManagerState extends Equatable {
  const AppLifecycleManagerState({
    this.appLifecycleState = AppLifecycleState.resumed,
  });

  final AppLifecycleState appLifecycleState;

  @override
  List<Object> get props => [appLifecycleState];

  AppLifecycleManagerState copyWith({
    AppLifecycleState? appLifecycleState,
  }) {
    return AppLifecycleManagerState(
      appLifecycleState: appLifecycleState ?? this.appLifecycleState,
    );
  }
}
