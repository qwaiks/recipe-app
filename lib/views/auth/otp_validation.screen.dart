import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/chefio_otp_form.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/routes.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({super.key});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  bool? disableResend = true;
  String? optExpirationDuration;
  String? otp;

  @override
  Widget build(BuildContext context) {
    final optInput = ChefioOTPForm(
        onChanged: (value) => setState(() {
              otp = value;
            }));

    final timer = Text.rich(
      TextSpan(text: Strings.optExpirationPrompt, children: [
        TextSpan(
          text: optExpirationDuration,
          style: Styles.bodyNormal.copyWith(color: AppColors.secondary),
        )
      ]),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 43,
                ),
                const Text(
                  Strings.checkMail,
                  style: Styles.headerLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Strings.checkMailPrompt,
                  style: Styles.bodyNormal
                      .copyWith(color: AppColors.secondaryText),
                ),
                const SizedBox(
                  height: 24,
                ),
                optInput,
                const SizedBox(
                  height: 48,
                ),
                timer,
                const SizedBox(
                  height: 24,
                ),
                ChefioButton(
                  text: Strings.next,
                  onPressed: () => context.go(RoutesPaths.resetPassword),
                ),
                const SizedBox(
                  height: 16,
                ),
                ChefioButton(
                  isOutlinedButton: true,
                  text: Strings.sendAgain,
                  textColor: AppColors.mainText,
                  backgroundColor: AppColors.outline,
                  onPressed: () => {},
                  disabled: disableResend ?? true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
