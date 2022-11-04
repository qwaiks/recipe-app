import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeStep extends StatelessWidget {
  final int stepIndex;
  const RecipeStep({super.key, required this.stepIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainText,
                ),
                child: Text(
                  stepIndex.toString(),
                  style: Styles.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SvgPicture.asset(SVGS.icDrag),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            children: [
              const ChefioTextField(
                hintText: Strings.foodDescHintText,
                outlined: true,
                multilined: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.form,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(SVGS.icCamera),
              )
            ],
          ))
        ],
      ),
    );
  }
}
