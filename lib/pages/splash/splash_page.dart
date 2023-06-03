import 'dart:async';

import 'package:app_version_update/app_version_update.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base/app/cubit/app_cubit.dart';
import 'package:base/commons/loading/loading.dart';
import 'package:base/global/constant/constant_enum.dart';
import 'package:base/global/environment.dart';
import 'package:base/global/routes.gr.dart';
import 'package:base/pages/splash/cubit/splash_cubit.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../global/app_themes.dart';
import '../../../../../helpers/size_extension.dart';
import '../../app/setup_locator.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double logoPadding = (50.h - 30);
  double loadingOpacity = 0.0;
  String? storeUrl;
  late bool animationLogo;

  @override
  void initState() {
    super.initState();
    animationLogo = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 200), () {
        FlutterNativeSplash.remove();
      });
      await dotenv.load(fileName: context.read<AppCubit>().state.environment.fileName);
      await setupLocator();
      // if (await checkAppVersion()) {
      //   await checkUpdateVersion();
      //   return;
      // }
      onReady();
    });
  }

  Future<bool> checkAppVersion() async {
    bool check = false;
    try {
      const appleId = '1505159184';
      const playStoreId = 'com.imap.employee';
      const country = 'vn';
      await AppVersionUpdate.checkForUpdates(appleId: appleId, playStoreId: playStoreId, country: country)
          .then((data) async {
        if (data.canUpdate == true) {
          storeUrl = data.storeUrl.toString();
          check = true;
        } else {
          check = false;
        }
      });
      return check;
    } catch (_) {
      return check;
    }
  }

  Future<void> checkUpdateVersion() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 0), minimumFetchInterval: const Duration(seconds: 0)));
    remoteConfig.fetchAndActivate().whenComplete(() async {
      // AppUpdateModel data = AppUpdateModel.fromJson(jsonDecode(remoteConfig.getString('mobile_version')));
      // var result = await showDialog(
      //     context: context,
      //     builder: (context) {
      //       return dialogUpdate(context, isRequired: data.store?.requestUpdate ?? false, storeUrl: storeUrl!);
      //     });
      // if (result == true) {
      //   await onReady();
      // }
    });
  }

  Future<void> onReady() async {
    context.pushRoute(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<SplashCubit, SplashState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == FetchStatus.fetchSuccess) {
                return;
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                ),
                const Positioned(
                  bottom: 16,
                  child: LoadingAnimation(
                    color: AppThemes.appRed,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dialogUpdate(BuildContext context, {required String storeUrl, bool isRequired = false}) {
  if (isRequired) {
    return CupertinoAlertDialog(
      content: Text(
          'Đã có phiên bản mới, vui lòng cập nhật để '
          'có trải nghiệm tốt '
          'nhất!',
          style: AppThemes.lightTextTheme.bodyMedium
              ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () async {
            await openStore(storeUrl);
          },
          child: Text('OK',
              style: AppThemes.lightTextTheme.bodyMedium
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue)),
        ),
      ],
    );
  }
  return CupertinoAlertDialog(
    content: Text(
        'Đã có phiên bản mới, vui lòng cập nhật để '
        'có trải nghiệm tốt '
        'nhất!',
        style: AppThemes.lightTextTheme.bodyMedium
            ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
    actions: <Widget>[
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () async {
          Navigator.pop(context, true);
        },
        child: Text('Huỷ',
            style: AppThemes.lightTextTheme.bodyMedium
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red)),
      ),
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () async {
          await openStore(storeUrl);
        },
        child: Text('OK',
            style: AppThemes.lightTextTheme.bodyMedium
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue)),
      ),
    ],
  );
}

Future<void> openStore(String storeUrl) async {
  final uri = Uri.parse(storeUrl);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
