import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meal_planet/constants/common_constants.dart';
import 'package:meal_planet/services/local_storage_service.dart';
import 'package:meal_planet/utils/login_utils.dart';

import '../common-widgets/app_toast.dart';
import '../constants/endpoints.dart';
import '../constants/http_methods.dart';
import '../services/http_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  onClickLogout() async {
    var refreshToken =
        await fetchStringFromSecureStorage(AuthConstants.refreshTokenKey);
    final Map<String, String> payload = {
      "refreshToken": refreshToken,
    };
    var response =
        await request(HttpMethods.POST, Endpoints.logout, payload: payload);
    if (response.statusCode == HttpStatus.ok) {
      await clearTokens();
      Navigator.pushNamed(context, "/");
    } else {
      AppToast().toastError("Logout Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24.0),
          const Text("Dashboard Page"),
          const SizedBox(height: 24.0),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: ElevatedButton(
              onPressed: onClickLogout,
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
