import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/routes.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/imgs.dart';
import '../../config/strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Image.asset(
            Imgs.onboardingImg,
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          const Text(
            Strings.startCooking,
            style: Styles.headerLarge,
          ),
          const SizedBox(height: 16),
          Text(
            Strings.onboardingDesc,
            style: Styles.bodyLagre.copyWith(color: AppColors.secondaryText),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ChefioButton(
              text: Strings.getStarted,
              fillWidth: true,
              onPressed: () => context.go(RoutesPaths.login),
            ),
          ),
          const SizedBox(
            height: 38,
          )
        ],
      ),
    ));
  }
}
