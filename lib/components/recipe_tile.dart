import 'dart:ui';

import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/imgs.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({super.key});

  @override
  Widget build(BuildContext context) {
    String recipeType = "Food";
    String recipeDuration = "60 mins";

    final profile = Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Image.asset(
            Imgs.dummyAvatar,
            width: 31,
            height: 31,
          ),
        ),
        const SizedBox(width: 8),
        const Text('Calum Lewis')
      ],
    );

    final featureItem = SizedBox(
        height: 151,
        width: 151,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(Imgs.dummyFeatured)),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: SvgPicture.asset(
                        SVGS.icHeartInactive,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));

    const title = Text(
      'Pancake',
      style: Styles.headerNormal,
    );

    final desc = Text('$recipeType ● >$recipeDuration',
        style: Styles.bodyNormal.copyWith(
          color: AppColors.secondaryText,
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          profile,
          const SizedBox(
            height: 16,
          ),
          featureItem,
          const SizedBox(
            height: 16,
          ),
          title,
          const SizedBox(
            height: 8,
          ),
          desc
        ],
      ),
    );
  }
}
