import 'package:chefio/components/chefio_icon.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/imgs.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'component/recipe_step_tile.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Image.asset(
            Imgs.dummyAvatar,
            width: 31,
            height: 31,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Calum Lewis',
          style: Styles.headerSmall,
        )
      ],
    );

    final likes = Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.primary,
            child: SvgPicture.asset(
              SVGS.icHeartActive,
              width: 15,
              height: 15,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          '273 Likes',
          style: Styles.headerSmall,
        )
      ],
    );

    final bottomHeader = PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: AppColors.outline,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Cacao Maca Walnut Milk',
                style: Styles.headerNormal,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Food • 60 mins',
                style: Styles.bodyNormal.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [profile, likes],
              )
            ],
          ),
        ),
      ),
    );

    final description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.description,
          style: Styles.headerNormal,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          """
Your recipe has been uploaded, you can see it on your profile.
 Your recipe has been uploaded, you can see it on your""",
          style: Styles.bodyNormal.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );

    final ingredients = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.ingredients,
          style: Styles.headerNormal,
        ),
        const SizedBox(
          height: 8,
        ),
        ...['4 eggs', '1/2 Butter', '1/2 Cheese']
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(SVGS.icCheck),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      e,
                      style: Styles.bodyNormal.copyWith(
                        color: AppColors.mainText,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );

    const divider = Divider(
      color: AppColors.outline,
      thickness: 2,
    );

    final steps = Column(
      children: [
        ...[1, 2, 3, 5, 6, 7, 8, 9]
            .map((e) => RecipeStepTile(
                  step: e,
                ))
            .toList()
      ],
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: ChefioIcon(
                svgIcon: SVGS.icBack,
                onTap: () {},
              ),
            ),
            bottom: bottomHeader,
            pinned: true,
            expandedHeight: 375,
            collapsedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Imgs.dummyFeatured,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  divider,
                  const SizedBox(
                    height: 16,
                  ),
                  description,
                  const SizedBox(
                    height: 16,
                  ),
                  divider,
                  const SizedBox(
                    height: 16,
                  ),
                  ingredients,
                  const SizedBox(
                    height: 16,
                  ),
                  divider,
                  const SizedBox(
                    height: 16,
                  ),
                  steps,
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
