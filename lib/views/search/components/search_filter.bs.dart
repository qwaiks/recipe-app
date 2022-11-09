import 'package:chefio/config/strings.dart';
import 'package:flutter/material.dart';

import '../../../components/chefio_button.dart';
import '../../../components/chefio_selection_chip.dart';
import '../../../components/chefio_slider.dart';
import '../../../config/colors.dart';
import '../../../config/style.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  const SearchFilterBottomSheet({super.key});

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final category = ChefioSelectionChip(
      items: Strings.recipeCategories,
      initialSelected: Strings.recipeCategories.first,
      onSelectionChange: (value) {
        setState(() {
          selectedCategory = value;
        });
      },
    );

    final buttons = Row(
      children: [
        Flexible(
          child: ChefioButton(
            text: Strings.cancel,
            onPressed: () {},
            backgroundColor: AppColors.form,
            textColor: AppColors.mainText,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: ChefioButton(
            text: Strings.done,
            onPressed: () {},
          ),
        )
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.category,
          style: Styles.headerNormal,
        ),
        const SizedBox(
          height: 16,
        ),
        category,
        const SizedBox(
          height: 16,
        ),
        Text.rich(
          TextSpan(text: Strings.cookingDuration, children: [
            TextSpan(
                text: Strings.cookingDurationCont,
                style:
                    Styles.bodyNormal.copyWith(color: AppColors.secondaryText))
          ]),
          style: Styles.headerNormal,
        ),
        const SizedBox(
          height: 16,
        ),
        ChefioSlider(
          values: const [10, 30, 60],
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 52,
        ),
        buttons
      ],
    );
  }
}
