import 'package:flutter/material.dart';

import '../../../../components/add_step_tile.dart';
import '../../../../config/imgs.dart';
import '../../../../config/style.dart';

class RecipeStepTile extends StatelessWidget {
  final int step;
  const RecipeStepTile({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepIndexWidget(index: step.toString()),
          const SizedBox(
            width: 24,
          ),
          Flexible(
            child: Column(
              children: [
                const Text(
                  'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                  style: Styles.headerNormal,
                ),
                const SizedBox(
                  height: 16,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Imgs.dummyFeatured,
                    width: double.infinity,
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
