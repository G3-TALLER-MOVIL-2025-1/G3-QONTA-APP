//import views
import 'package:qonta_app/views/welcome_view.dart';
import 'package:qonta_app/views/register_view.dart';

//set routes names
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'welcome': (_) => const WelcomeView(),
  'register': (_) => const RegisterView(),
};