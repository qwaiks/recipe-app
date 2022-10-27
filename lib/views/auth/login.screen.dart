import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/imgs.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            Strings.welcome,
            style: Styles.headerLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            Strings.accountDetailPrompt,
            style: Styles.bodySmall.copyWith(color: AppColors.secondaryText),
          ),
          const SizedBox(
            height: 32,
          ),
          const ChefioTextField(
            hintText: Strings.loginHintText,
            leadingIcon: SVGS.icMail,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          ChefioTextField(
            hintText: Strings.password,
            leadingIcon: SVGS.icLock,
            isPasswordField: true,
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
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ChefioButton(
              text: Strings.forgetPassword,
              isTextButton: true,
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 72,
          ),
          ChefioButton(
            text: Strings.login,
            onPressed: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ChefioButton(
            text: Strings.google,
            leadingIcon: SVGS.icGoogle,
            backgroundColor: AppColors.googleColor,
            onPressed: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          Text.rich(
            TextSpan(
              text: Strings.registerOption,
              children: [
                TextSpan(
                    text: Strings.signUp,
                    style:
                        Styles.bodyNormal.copyWith(color: AppColors.primary)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
