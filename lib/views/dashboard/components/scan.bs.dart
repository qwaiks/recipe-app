import 'package:chefio/config/colors.dart';
import 'package:chefio/config/imgs.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

class ScanBottomSheet extends StatelessWidget {
  const ScanBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        option(image: Imgs.foodOption, title: Strings.food),
        const SizedBox(
          width: 20,
        ),
        option(image: Imgs.ingredientOption, title: Strings.ingredient)
      ],
    );
  }
}

Widget option({required String image, required String title}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outline,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 96,
            width: 96,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: Styles.headerSmall,
          )
        ],
      ),
    ),
  );
}
