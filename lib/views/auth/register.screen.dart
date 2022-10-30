import 'package:chefio/config/colors.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

import '../../components/chefio_textfield.dart';
import '../../config/svgs.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
      children: [],
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
              form
            ],
          ),
        ),
      ),
    ));
  }
}
