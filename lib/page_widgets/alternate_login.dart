import 'package:flutter/material.dart';

class AlternateLogin extends StatefulWidget {
  const AlternateLogin({super.key});

  @override
  State<AlternateLogin> createState() => _AlternateLoginState();
}

class _AlternateLoginState extends State<AlternateLogin> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 49,
              width: 49,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/apple.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: 49,
              width: 49,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/google.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: 49,
              width: 49,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/fb.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
