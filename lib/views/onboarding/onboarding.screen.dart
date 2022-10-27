import 'package:chefio/components/chefio_button.dart';
import 'package:flutter/material.dart';

import '../../config/imgs.dart';
import '../../config/strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          Imgs.onboardingImg,
          height: 410,
          fit: BoxFit.cover,
        ),
        const Text(Strings.startCooking),
        const SizedBox(height: 16),
        const Text(Strings.onboardingDesc),
        const Spacer(),
        ChefioButton(
          text: Strings.getStarted,
          onPressed: () {},
        ),
        const SizedBox(
          height: 38,
        )
      ],
    ));
  }
}
