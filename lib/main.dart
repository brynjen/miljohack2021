import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/application/main/send_token/send_token.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/main/pages/posten_main.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    await Firebase.initializeApp();
    setupDependencyInjection();
    await setupFirebaseMessaging();
    runApp(const Miljohack2021());
  }, (error, stackTrace) {});
}

class Miljohack2021 extends StatelessWidget {
  const Miljohack2021({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PackageListBloc>(
          create: (_) => PackageListBloc()..add(LoadPackages()),
        ),
        BlocProvider<SendtokenBloc>(create: (_) => SendtokenBloc()),
      ],
      child: MaterialApp(
        title: 'Miljøhack 2021 - Posten',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeListResolutionCallback: (locales, supported) =>
            findLocale(locales: locales, supportedLocales: supported),
        home: const PostenMain(),
      ),
    );
  }
}

void setupDependencyInjection() {
  GetIt.instance.registerLazySingleton(() => ApiClient());
}

Future<void> setupFirebaseMessaging() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //log('Handling a background message ${message.messageId}');
}

Locale findLocale({
  required List<Locale>? locales,
  required Iterable<Locale> supportedLocales,
}) {
  final supportedLanguages =
      supportedLocales.map((e) => e.languageCode).toList();
  final primaryLocale = locales!.firstWhere(
    (locale) => supportedLanguages.contains(locale.languageCode),
    orElse: () => const Locale('en', 'US'),
  );
  return primaryLocale;
}
