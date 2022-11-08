import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/routes.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Form(
      child: Column(
        children: [
          const ChefioTextField(
            hintText: Strings.loginHintText,
            leadingIcon: SVGS.icMail,
            outlined: true,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          ChefioTextField(
            hintText: Strings.password,
            leadingIcon: SVGS.icLock,
            isPasswordField: true,
            outlined: true,
            inputType: TextInputType.text,
            validators: (value) {
              if (value != null) {
                if (value.isEmpty) {
                  return '';
                }
              }
              return null;
            },
          ),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 107,
                ),
                const Text(
                  Strings.welcome,
                  style: Styles.headerLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Strings.accountDetailPrompt,
                  style: Styles.bodyNormal
                      .copyWith(color: AppColors.secondaryText),
                ),
                const SizedBox(
                  height: 32,
                ),
                form,
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChefioButton(
                    text: Strings.forgetPassword,
                    isTextButton: true,
                    fillWidth: false,
                    textColor: AppColors.mainText,
                    onPressed: () => GoRouter.of(context).push(
                      RoutesPaths.accountRecovery,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                ChefioButton(
                  fillWidth: true,
                  text: Strings.login,
                  onPressed: () => context.push(
                    RoutesPaths.dashboard,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  Strings.continueWith,
                  style: Styles.bodyNormal.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ChefioButton(
                  fillWidth: true,
                  text: Strings.google,
                  leadingIcon: SVGS.icGoogle,
                  backgroundColor: AppColors.googleColor,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                Text.rich(
                    TextSpan(
                      text: Strings.registerOption,
                      children: [
                        TextSpan(
                            text: Strings.signUp,
                            style: Styles.headerSmall
                                .copyWith(color: AppColors.primary)),
                      ],
                    ),
                    style: Styles.bodyNormal),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
