// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FetchStatus.idle,
    this.errorMsg = "",
  });

  final FetchStatus status;
  final String errorMsg;

  @override
  List<Object?> get props => [
        status,
        errorMsg,
      ];

  HomeState copyWith({
    FetchStatus? status,
    String? errorMsg,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
