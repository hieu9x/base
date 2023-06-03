part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    this.status,
  });

  final FetchStatus? status;

  @override
  List<Object?> get props => [status];

  SplashState copyWith({
    FetchStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
