import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/validation_check_title.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/chefio_textfield.dart';
import '../../config/svgs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordCharacterCheck = true;
  bool passwordNumericalCheck = false;

  @override
  Widget build(BuildContext context) {
    final form = Form(
      child: Column(
        children: [
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
        ],
      ),
    );

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

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            24,
          ),
          child: Column(
            children: [
              const Text(
                Strings.welcome,
                style: Styles.headerLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(Strings.accountDetailPrompt,
                  style: Styles.bodyNormal
                      .copyWith(color: AppColors.secondaryText)),
              const SizedBox(
                height: 32,
              ),
              form,
              const SizedBox(
                height: 24,
              ),
              passwordValidate,
              const SizedBox(
                height: 24,
              ),
              ChefioButton(
                text: Strings.signUp,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    ));
  }
}
