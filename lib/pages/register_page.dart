import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_planet/constants/endpoints.dart';
import 'package:meal_planet/constants/http_methods.dart';
import 'package:meal_planet/services/http_service.dart';

import '../common-widgets/app_toast.dart';
import '../constants/app_colors.dart';
import '../page_widgets/alternate_login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signup() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String userName = userNameController.text;
    String password = passwordController.text;

    final Map<String, String> payload = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "userName": userName,
      "password": password,
    };
    var response =
        await request(HttpMethods.POST, Endpoints.rigister, payload: payload);
    var responseMap = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == HttpStatus.created) {
      AppToast().toastSuccess(responseMap["message"]);
      Navigator.pushNamed(context, "/");
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
                alignment: Alignment.topLeft,
                child: Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.05),
              SizedBox(
                width: double.infinity, // 100% width
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Rounded border
                    color: AppColors.inputBgColor,
                  ),
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
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
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
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
                    controller: userNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'User Name*',
                      hintStyle: TextStyle(
                        color: AppColors.textSpanColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.02),
              const FittedBox(
                child: Text(
                  'Or Sign in with',
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
                  onPressed: _signup,
                  child: const FittedBox(
                    child: Text(
                      'Create Account',
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
              FittedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have an account?',
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
                        text: 'Log in',
                        style: const TextStyle(
                          color: AppColors.btnBgColor,
                          fontSize: 16.28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.08,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/login");
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
