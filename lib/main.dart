import 'dart:io';
import 'package:qonta_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:qonta_app/config/routes/routes_config.dart';
import 'package:flutter/services.dart';
import '../utils/user_preferences.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.instance.init();
  // Cambiar color de la barra de estado
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor, // tu color verde, por ejemplo
    statusBarIconBrightness: Brightness.light, // íconos claros si el fondo es oscuro
  ));
  HttpOverrides.global = MyHttpOverrides();
  runApp(const QontaApp());
}

class QontaApp extends StatelessWidget {
  const QontaApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qonta App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'welcome',
      routes: routes,
    );
  }
}
