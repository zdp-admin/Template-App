import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/router.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/providers/provider.dart';
import 'package:template/providers/push_notification_provider.dart';
import 'package:template/utils/app_settings.dart';
import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/startup_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupService();

  new PushNotificationProvider();

  final prefs = new PreferencesUser();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    final prefs = new PreferencesUser();

    Timer.periodic(new Duration(seconds: 3), (timer) {
      if (!prefs.logged) {
        if (prefs.activeRoute != 'login') {
          //appService<NavigationService>().navigateToAndRemoveHistory('login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Template Prueba',
        theme: appService<AppSettings>().appTheme,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('es')],
        navigatorKey: appService<NavigationService>().navigationKey,
        onGenerateRoute: generateRoute,
        home: StartUpView(),
      ),
    );
  }
}
