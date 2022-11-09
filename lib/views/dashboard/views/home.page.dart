import 'package:chefio/components/chefio_selection_chip.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';

import '../../../components/recipe_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 310,
        childAspectRatio: 12,
      ),
      itemBuilder: (context, index) => const RecipeTile(),
    );

    final category = ChefioSelectionChip(
        items: Strings.recipeCategories,
        onSelectionChange: (value) {},
        initialSelected: 'All');

    const search = ChefioTextField(
      hintText: Strings.search,
      leadingIcon: SVGS.icSearch,
      showSuffix: true,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              search,
              const SizedBox(
                height: 16,
              ),
              category,
              recipes
            ],
          ),
        ),
      ),
    );
  }
}
