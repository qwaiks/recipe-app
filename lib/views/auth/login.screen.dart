import 'package:chefio/config/imgs.dart';
import 'package:chefio/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Imgs.onboardingImg),
          Text(Strings.startCooking),
          const SizedBox(height: 16),
          Text(Strings.onboardingDesc),
        ],
      ),
    );
  }
}
