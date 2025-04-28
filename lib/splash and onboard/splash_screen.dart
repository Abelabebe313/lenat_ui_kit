import 'package:flutter/material.dart';
import 'package:lenat_ui_kit/common/colors.dart';

import 'onboarding_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary,
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
    );
  }
}
