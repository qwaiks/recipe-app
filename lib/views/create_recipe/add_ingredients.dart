import 'dart:ui';

import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/ingredient_title.dart';
import 'package:chefio/components/recipe_step.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class AddIngredientScreen extends StatefulWidget {
  const AddIngredientScreen({super.key});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
  int ingredientCount = 1;
  int recipeSteps = 1;

  @override
  Widget build(BuildContext context) {
    final ingredientList = SliverList(
      delegate: SliverChildListDelegate(
        [
          const Text(
            Strings.ingredients,
            style: Styles.headerNormal,
          ),
          const SizedBox(
            height: 16,
          ),
          for (int index = 0; index < ingredientCount; index++)
            IngredientTile(
              key: ValueKey(index),
            ),
          const SizedBox(
            height: 16,
          ),
          ChefioButton(
            text: Strings.ingredient,
            leadingIcon: SVGS.icAdd,
            isOutlinedButton: true,
            textColor: AppColors.mainText,
            backgroundColor: AppColors.outline,
            onPressed: () {
              setState(() {
                ingredientCount++;
              });
            },
          ),
        ],
      ),
    );

    final steps = SliverList(
        delegate: SliverChildListDelegate([
      const Text(
        Strings.steps,
        style: Styles.headerNormal,
      ),
      const SizedBox(
        height: 16,
      ),
      for (int index = 0; index < recipeSteps; index++)
        RecipeStep(
          key: ValueKey(index),
          stepIndex: index + 1,
        ),
      const SizedBox(
        height: 16,
      ),
      ChefioButton(
        text: Strings.step,
        leadingIcon: SVGS.icAdd,
        isOutlinedButton: true,
        textColor: AppColors.mainText,
        backgroundColor: AppColors.outline,
        onPressed: () {
          setState(() {
            recipeSteps++;
          });
        },
      ),
    ]));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [ingredientList, steps],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: ChefioButton(
                      text: Strings.back,
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
                      text: Strings.next,
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            // color: AppColors.mainText.withOpacity(0.5),
            // shadowColor: AppColors.primary.withAlpha(1),
            child: child,
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      proxyDecorator: proxyDecorator,
      children: _items
          .map(
            (e) => IngredientTile(
              key: Key('$e'),
            ),
          )
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
