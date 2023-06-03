import 'dart:async';

import 'package:base/global/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uni_links/uni_links.dart';

import 'app/app_lifecycle/app_lifecycle.dart';
import 'app/app_lifecycle/cubit/app_lifecycle_manager_cubit.dart';
import 'app/cubit/app_cubit.dart';
import 'app/setup_locator.dart';
import 'global/app_themes.dart';
import 'global/l10n/l10n.dart';
import 'global/local_notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await localNotificationService.setupFlutterNotifications();
  }
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    localNotificationService.showFlutterNotification(message);
  });
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  getIt = GetIt.instance;
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => AppLifecycleManagerCubit(),
      ),
      BlocProvider(
        create: (_) => AppCubit(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        if (uri != null) {
          processLink(uri);
        }
      });
    }
  }

  Future<void> processLink(Uri? link) async {
    if (link == null) {
      return;
    }
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        themeMode: ThemeMode.system,
        color: const Color(0xFF0B0C21),
        title: 'IMAP Employee',
        routerConfig: _appRouter.config(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale(context.read<AppCubit>().state.language ?? 'vi'),
        supportedLocales: L10n.all,
      ),
    );
  }
}
