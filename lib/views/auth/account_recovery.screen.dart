import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/routes.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/svgs.dart';

class AccountRecoveryScreen extends StatelessWidget {
  const AccountRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 107,
                ),
                const Text(
                  Strings.passwordRecovery,
                  style: Styles.headerLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Strings.passwordRecoveryPrompt,
                  style: Styles.bodyNormal.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const ChefioTextField(
                  hintText: Strings.loginHintText,
                  leadingIcon: SVGS.icMail,
                  outlined: true,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 32,
                ),
                ChefioButton(
                  text: Strings.recover,
                  onPressed: () =>
                      GoRouter.of(context).go(RoutesPaths.otpValidation),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
