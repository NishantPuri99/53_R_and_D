import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './providers/auth_provider.dart';
import './screens/navigator_screen.dart';

Future<void> main() async {
  // Ensures all the future functions of main() finish before launching the app
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Restricts rotation of screen
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    DevicePreview(
      // to check the UI on different devices make enabled true
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: NavigatorScreen(),
      ),
    );

  }
}
