import 'package:chefio/components/chefio_selection_chip.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';

import '../../../components/recipe_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = GridView.builder(
      itemCount: 3,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 310,
        childAspectRatio: 12,
      ),
      itemBuilder: (context, index) => RecipeTile(),
    );

    final category = ChefioSelectionChip(
        items: ['All', 'Food', 'Drinks'],
        onSelectionChange: (value) {},
        initialSelected: 'All');

    const search = ChefioTextField(
      hintText: Strings.search,
      leadingIcon: SVGS.icSearch,
      showSuffix: true,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
