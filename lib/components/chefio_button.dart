import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool disabled;
  final String? text;
  final bool isTextButton;
  final bool isOutlinedButton;
  final String? leadingIcon;

  const ChefioButton(
      {super.key,
      this.onPressed,
      this.disabled = false,
      this.text,
      this.isTextButton = false,
      this.isOutlinedButton = false,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    final outlineStyle = OutlinedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: Styles.bodyNormal,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
    );

    final buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: Styles.bodyNormal,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)));

    final textStyle = TextButton.styleFrom(
      textStyle: Styles.bodyNormal,
    );
    return ElevatedButton(
      onPressed: disabled! ? onPressed : null,
      style: isOutlinedButton
          ? outlineStyle
          : isTextButton
              ? textStyle
              : buttonStyle,
      child: Text(text ?? ''),
    );
  }

  Widget iconButton() {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(leadingIcon!),
        label: Text(text!));
  }
}
