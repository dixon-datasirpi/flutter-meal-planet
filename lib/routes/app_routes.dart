import 'package:meal_planet/pages/dashboard_page.dart';
import 'package:meal_planet/pages/login_page.dart';

import '../pages/my_home_page.dart';
import '../pages/register_page.dart';

class AppRoutes {
  static final routes = {
    "/": (context) => const MyHomePage(title: 'Meal Planet'),
    "/login": (context) => const LoginPage(),
    "/register": (context) => const RegisterPage(),
    "/dashboard": (context) => const DashboardPage(),
  };
}
