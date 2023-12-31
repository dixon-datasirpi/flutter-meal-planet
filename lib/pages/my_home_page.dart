import 'package:flutter/material.dart';
import 'package:meal_planet/common-widgets/loading_indicator.dart';
import 'package:meal_planet/pages/dashboard_page.dart';
import 'package:meal_planet/pages/landing_page.dart';
import 'package:meal_planet/services/auth_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isAuthorized = false;

  Future<bool> setIsAuthorized() async {
    isAuthorized = await isAuthorised();
    return isAuthorized;
  }

  _getInitialPage() {
    return isAuthorized ? const DashboardPage() : const LandingPage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setIsAuthorized(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            // If there's an error while fetching data
            return Text('Error: ${snapshot.error}');
          } else {
            // When data fetching is successful
            return _getInitialPage();
          }
        });
  }
}
