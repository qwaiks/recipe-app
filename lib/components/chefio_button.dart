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
  final int? width;
  final Color? textColor;
  final Color? backgroundColor;

  const ChefioButton(
      {super.key,
      this.onPressed,
      this.width,
      this.disabled = false,
      this.text,
      this.isTextButton = false,
      this.isOutlinedButton = false,
      this.leadingIcon,
      this.textColor = Colors.white,
      this.backgroundColor = AppColors.primary});

  //TODO: IMPLEMENTATION OF FACTORY METHODS FOR ICON AND TEXT BUTTOM IMPL

  @override
  Widget build(BuildContext context) {
    final outlineStyle = OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      textStyle: Styles.bodyNormal,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
    );

    final buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: Styles.bodyNormal.copyWith(color: textColor),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)));

    final textStyle = TextButton.styleFrom(
        textStyle: Styles.bodyNormal.copyWith(color: textColor),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)));

    return ElevatedButton(
      onPressed: disabled ? onPressed : null,
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
