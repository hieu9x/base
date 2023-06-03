part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.language,
    this.appVersion,
    this.environment = 'PROD',
    this.fcmToken = '',
  });
  final String? language;
  final String? appVersion;
  final String environment;
  final String fcmToken;

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      language: json['language'] ?? Platform.localeName.substring(0, 2),
      environment: json['environment'] ?? 'PROD',
      fcmToken: json['fcm_token'] ?? '',
    );
  }

  Map<String, dynamic>? toJson() {
    return <String, dynamic>{
      "language": language,
      "environment": environment,
      "fcm_token": fcmToken,
    };
  }

  @override
  List<Object?> get props => [
        language,
        environment,
        appVersion,
        fcmToken,
      ];

  AppState copyWith({
    String? language,
    String? environment,
    String? appVersion,
    String? fcmToken,
  }) {
    return AppState(
      language: language ?? this.language,
      environment: environment ?? this.environment,
      appVersion: appVersion ?? this.appVersion,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
