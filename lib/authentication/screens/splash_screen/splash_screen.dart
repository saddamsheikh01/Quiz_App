import 'package:flutter/material.dart';
import 'package:quiz_app/authentication/screens/signup/signup_screen.dart';
import 'package:quiz_app/model/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child:CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            "assets/images/img.png",
          ),
        ),

      ),
    );
  }
}
