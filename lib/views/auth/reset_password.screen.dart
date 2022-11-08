import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

import '../../components/chefio_textfield.dart';
import '../../components/validation_check_title.dart';
import '../../config/strings.dart';
import '../../config/svgs.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool passwordCharacterCheck = false;
  bool passwordNumericalCheck = false;
  @override
  Widget build(BuildContext context) {
    final passwordValidate = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.passwordValidationPrompt,
          style: Styles.bodyLagre,
        ),
        const SizedBox(
          height: 16,
        ),
        ValidationCheckTile(
            isValid: passwordCharacterCheck,
            text: Strings.passwordCharacterValidationPrompt),
        const SizedBox(
          height: 16,
        ),
        ValidationCheckTile(
            isValid: passwordNumericalCheck,
            text: Strings.passwordNumberValidationPrompt)
      ],
    );

    final passwordField = ChefioTextField(
      hintText: Strings.password,
      leadingIcon: SVGS.icLock,
      isPasswordField: true,
      outlined:true,
      inputType: TextInputType.text,
      validators: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return '';
          }
        }
        return null;
      },
    );

    final button = ChefioButton(
      onPressed: () {},
      text: Strings.done,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 79,
                ),
                const Text(
                  Strings.resetPasswordTitle,
                  style: Styles.headerLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(Strings.resetPasswordPrompt,
                    style: Styles.bodyNormal.copyWith(
                      color: AppColors.secondaryText,
                    )),
                const SizedBox(
                  height: 24,
                ),
                passwordField,
                const SizedBox(
                  height: 24,
                ),
                passwordValidate,
                const SizedBox(
                  height: 24,
                ),
                button,
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
