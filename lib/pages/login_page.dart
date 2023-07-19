import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_planet/common-widgets/app_toast.dart';
import 'package:meal_planet/constants/app_colors.dart';
import 'package:meal_planet/constants/endpoints.dart';
import 'package:meal_planet/constants/http_methods.dart';
import 'package:meal_planet/services/http_service.dart';
import 'package:meal_planet/utils/login_utils.dart';

import '../page_widgets/alternate_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _login() async {
    String userName = emailController.text;
    String password = passwordController.text;
    final Map<String, String> payload = {
      "userName": userName,
      "password": password,
    };
    var response =
        await request(HttpMethods.POST, Endpoints.login, payload: payload);
    var responseMap = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == HttpStatus.ok) {
      AppToast().toastSuccess(responseMap["message"]);
      await saveTokenFromLoginResponse(responseMap);
      Navigator.pushNamed(context, "/dashboard");
    } else {
      AppToast().toastError(responseMap[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        double parentHeight = constraints.maxHeight;
        return Container(
          margin: const EdgeInsets.fromLTRB(29, 0, 29, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.1),
              SizedBox(
                width: double.infinity, // 100% width
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Rounded border
                    color: AppColors.inputBgColor,
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email/User Name*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.02),
              SizedBox(
                width: double.infinity, // 100% width
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Rounded border
                    color: AppColors.inputBgColor,
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.03),
              Container(
                width: double.infinity, // 100% width
                height: 56,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.btnBgColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: _login,
                  child: const FittedBox(
                    child: Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.02),
              const FittedBox(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.gray4Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.98,
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.02),
              const FittedBox(
                child: Text(
                  'Or Login with',
                  style: TextStyle(
                    color: AppColors.textSpanColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.09,
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.02),
              const AlternateLogin(),
              SizedBox(height: parentHeight * 0.03),
              FittedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'New user?',
                        style: TextStyle(
                          color: AppColors.textSpanColor2,
                          fontSize: 16.28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontSize: 16.28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: AppColors.btnBgColor,
                          fontSize: 16.28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.08,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/register");
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
