import 'package:chefio/components/chefio_slider.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/strings.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  double? _value = 0;

  @override
  Widget build(BuildContext context) {
    final featureImage = Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SvgPicture.asset(SVGS.icImage),
          const SizedBox(
            height: 16,
          ),
          const Text(
            Strings.addCoverPhoto,
            style: Styles.headerSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            Strings.imageUploadLimit,
            style: Styles.bodySmall,
          ),
        ],
      ),
    );

    final form = Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ChefioTextField(
            label: Strings.foodName,
            hintText: Strings.foodNameHintText,
          ),
          const SizedBox(
            height: 24,
          ),
          const ChefioTextField(
            label: Strings.description,
            hintText: Strings.foodDescHintText,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text.rich(
            TextSpan(text: Strings.cookingDuration, children: [
              TextSpan(
                  text: Strings.cookingDurationCont, style: Styles.bodyNormal)
            ]),
            style: Styles.headerNormal,
          ),
          const SizedBox(
            height: 16,
          ),
          ChefioSlider(
            values: const [10, 30, 60],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          )
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [form],
          ),
        ),
      ),
    );
  }
}
