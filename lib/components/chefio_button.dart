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
  final bool? fillWidth;
  final Color? textColor;
  final Color? backgroundColor;

  const ChefioButton(
      {super.key,
      this.onPressed,
      this.fillWidth = true,
      this.disabled = false,
      this.text,
      this.isTextButton = false,
      this.isOutlinedButton = false,
      this.leadingIcon,
      this.textColor = Colors.white,
      this.backgroundColor = AppColors.primary});

  //TODO: IMPLEMENTATION OF FACTORY METHODS FOR ICON AND TEXT BUTTOM IMPL
  // Change background color and text color textColor: AppColors.mainText,
  // backgroundColor: AppColors.outline, for outline.

  @override
  Widget build(BuildContext context) {
    final outlineStyle = OutlinedButton(
      onPressed: !disabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        textStyle: Styles.bodyNormal.copyWith(color: textColor),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        minimumSize: (fillWidth!) ? const Size.fromHeight(50) : null,
        side: BorderSide(color: backgroundColor!, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(color: backgroundColor!, width: 1),
        ),
      ),
      child: Text(
        text ?? '',
        style: Styles.bodyNormal.copyWith(
          color: disabled ? AppColors.secondaryText : textColor,
        ),
      ),
    );

    final buttonStyle = ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          textStyle: Styles.bodyNormal.copyWith(color: textColor),
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 19,
          ),
          minimumSize: (fillWidth!) ? const Size.fromHeight(50) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          text ?? '',
          style: Styles.bodyNormal.copyWith(
            color: textColor,
          ),
        ));

    final textStyle = TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: Styles.bodyNormal.copyWith(
            color: textColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 19,
          ),
          minimumSize: (fillWidth!) ? const Size.fromHeight(50) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          text ?? '',
          style: Styles.bodyNormal.copyWith(
            color: textColor,
          ),
        ));

    return isOutlinedButton
        ? outlineStyle
        : isTextButton
            ? textStyle
            : buttonStyle;
  }

  Widget iconButton() {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(leadingIcon!),
        label: Text(text!));
  }
}
