import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        key: key,
        children: [
          SvgPicture.asset(SVGS.icDrag),
          const SizedBox(
            width: 16,
          ),
          const Flexible(
            child: ChefioTextField(
              hintText: Strings.enterIngredients,
              outlined: true,
            ),
          )
        ],
      ),
    );
  }
}
