import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/colors.dart';
import '../../../config/style.dart';

class BottomItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool selected;
  final int index;
  final Function(int) onTap;

  const BottomItem({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              color: selected ? AppColors.primary : AppColors.secondaryText,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Styles.bodySmall.copyWith(
                  color:
                      selected ? AppColors.primary : AppColors.secondaryText),
            )
          ],
        ),
      ),
    );
  }
}
