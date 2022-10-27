import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioTextField extends StatelessWidget {
  final String? hintText;
  final String? leadingIcon;
  final TextInputType inputType;
  final bool outlined;

  const ChefioTextField(
      {super.key,
      this.hintText,
      this.leadingIcon,
      this.outlined = false,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(
        width: outlined ? 1.0 : 0.0,
        color: AppColors.textFieldBorderColor,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: hintText,
      hintStyle: Styles.bodyNormal.copyWith(
        color: AppColors.hintTextColor,
      ),
      prefixIconConstraints: BoxConstraints.tight(const Size.fromWidth(24)),
      prefixIcon: (leadingIcon != null) ? SvgPicture.asset(leadingIcon!) : null,
      suffixIcon: InkWell(
        onTap: () {},
        radius: 30,
        child: SvgPicture.asset(SVGS.icClose),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      fillColor: AppColors.form,
      border: outlineBorder,
      errorBorder: outlineBorder.copyWith(
        borderSide:
            outlineBorder.borderSide.copyWith(color: AppColors.secondary),
      ),
    );

    return TextField(
      keyboardType: inputType,
      decoration: inputDecoration,
    );
  }
}
