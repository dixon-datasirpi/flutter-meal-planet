import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meal_planet/constants/app_colors.dart';
import 'package:meal_planet/routes/app_routes.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Planet',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: "Poppins"),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appPrimaryColor),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: AppRoutes.routes,
    );
  }
}
