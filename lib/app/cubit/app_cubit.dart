import 'dart:io';

import 'package:base/app/repositories/app_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_state.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(const AppState());
  final DatabaseReference fbDb = FirebaseDatabase.instance.ref();

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }

  getVersion() {
    PackageInfo.fromPlatform().then((appInfo) {
      emit(state.copyWith(appVersion: '${appInfo.version}.${appInfo.buildNumber}'));
    });
  }

  updateEnvironment(String environment) {
    emit(
      state.copyWith(environment: environment),
    );
  }

  sendError({required String screen, required String error}) {
    fbDb
        .child('error')
        .child(screen)
        // .child(DateFormat('dd-MM-yyyy').format(DateTime.now()))
        // .child((state.profile?.iId ?? 0).toString())
        .child('error')
        .set(error);
  }

  saveFcmToken(String fcmToken) {
    emit(state.copyWith(fcmToken: fcmToken));
  }

  updateFcmToken(String deviceId) async {
    try {
      final appRepo = AppRepositories();
      String? deviceLocalNow = await FlutterUdid.udid;
      final fcmTokenNow = await FirebaseMessaging.instance.getToken() ?? '';
      if (deviceId == deviceLocalNow && fcmTokenNow != state.fcmToken) {
        final data = await appRepo.updateDevice(
          deviceId: deviceId,
          fcmToken: fcmTokenNow,
          appVersion: state.appVersion ?? '2.0.8',
        );
        emit(state.copyWith(fcmToken: fcmTokenNow));
      }
    } catch (_) {}
  }
}
