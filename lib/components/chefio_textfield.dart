import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioTextField extends StatefulWidget {
  final String? hintText;
  final String? leadingIcon;
  final TextInputType inputType;
  final bool outlined;
  final bool isPasswordField;
  final bool showSuffix;
  final TextEditingController? controller;
  final String? Function(String?)? validators;

  const ChefioTextField(
      {super.key,
      this.hintText,
      this.leadingIcon,
      this.outlined = false,
      this.isPasswordField = false,
      this.showSuffix = false,
      this.inputType = TextInputType.text,
      this.validators,
      this.controller});

  @override
  State<ChefioTextField> createState() => _ChefioTextFieldState();
}

class _ChefioTextFieldState extends State<ChefioTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(
        width: widget.outlined ? 1.0 : 0.0,
        color: AppColors.textFieldBorderColor,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: widget.hintText,
      hintStyle: Styles.bodyNormal.copyWith(
        color: AppColors.hintTextColor,
      ),
      prefixIconConstraints: BoxConstraints.tight(const Size(60, 24)),
      prefixIcon: (widget.leadingIcon != null)
          ? SvgPicture.asset(widget.leadingIcon!)
          : null,
      suffixIconConstraints: BoxConstraints.tight(const Size(60, 24)),
      suffixIcon: widget.isPasswordField
          ? _buildPasswordFieldVisibilityToggle()
          : widget.showSuffix
              ? _defaultSuffixToogle()
              : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      fillColor: AppColors.form,
      border: outlineBorder,
      focusedBorder: outlineBorder.copyWith(
          borderSide: outlineBorder.borderSide
              .copyWith(color: AppColors.mainText, width: 1)),
      errorBorder: outlineBorder.copyWith(
        borderSide:
            outlineBorder.borderSide.copyWith(color: AppColors.secondary),
      ),
    );

    return TextFormField(
      keyboardType: widget.inputType,
      decoration: inputDecoration,
      validator: widget.validators,
      obscureText: widget.isPasswordField ? _obscureText : false,
      cursorColor: AppColors.primary,
      controller: widget.controller,
      style: Styles.headerNormal,
    );
  }

  Widget _defaultSuffixToogle() {
    return InkWell(
      onTap: () {},
      radius: 30,
      child: SvgPicture.asset(SVGS.icClose),
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: SvgPicture.asset(
        _obscureText ? SVGS.icPasswordVisible : SVGS.icPasswordHidden,
      ),
    );
  }
}
