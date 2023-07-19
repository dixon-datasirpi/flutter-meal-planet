import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_planet/constants/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double parentHeight = constraints.maxHeight;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.appPrimaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: parentHeight * 0.2),
              Container(
                margin: const EdgeInsets.fromLTRB(55, 0, 55, 0),
                width: double.infinity,
                height: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/meal_planet_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.3),
              Container(
                margin: const EdgeInsets.fromLTRB(29, 0, 29, 0),
                width: double.infinity, // 100% width
                height: 56,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () => {Navigator.pushNamed(context, "/register")},
                  child: const Text(
                    'Create account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.03),
              Text.rich(
                TextSpan(
                  text: "Login",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/login");
                    },
                ),
              ),
              SizedBox(height: parentHeight * 0.05),
            ],
          ),
        );
      }),
    );
  }
}
