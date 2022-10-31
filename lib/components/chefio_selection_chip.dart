import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

class ChefioSelectionChip extends StatelessWidget {
  final String label;
  final ValueChanged<String> onTap;
  final Color activeColor, inActiveColor;
  final String selectedItem;
  final bool? isOutline;

  const ChefioSelectionChip(
      {super.key,
      required this.label,
      required this.onTap,
      required this.activeColor,
      required this.inActiveColor,
      required this.selectedItem,
      this.isOutline});

  @override
  Widget build(BuildContext context) {
    final isActive = label == selectedItem;
    return Chip(
      label: Text(label,
          style: isActive
              ? Styles.bodyLagre.copyWith(color: Colors.white)
              : Styles.bodyNormal.copyWith(color: AppColors.secondaryText)),
      side: BorderSide(
          width: isOutline ?? false ? 1 : 0,
          color: isOutline ?? false
              ? AppColors.secondaryText
              : Colors.transparent),
      backgroundColor: isActive
          ? activeColor
          : isOutline ?? false
              ? Colors.transparent
              : inActiveColor,
    );
  }
}
