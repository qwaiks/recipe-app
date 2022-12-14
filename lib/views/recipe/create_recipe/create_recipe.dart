import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/components/chefio_image_picker.dart';
import 'package:chefio/components/chefio_slider.dart';
import 'package:chefio/components/chefio_textfield.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/routes.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/strings.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    const featureImage = ChefioImagePicker();

    final form = Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ChefioTextField(
            label: Strings.foodName,
            hintText: Strings.foodNameHintText,
            outlined: true,
          ),
          const SizedBox(
            height: 24,
          ),
          const ChefioTextField(
            label: Strings.description,
            hintText: Strings.foodDescHintText,
            outlined: true,
            multilined: true,
          ),
          const SizedBox(
            height: 24,
          ),
          Text.rich(
            TextSpan(text: Strings.cookingDuration, children: [
              TextSpan(
                  text: Strings.cookingDurationCont,
                  style: Styles.bodyNormal
                      .copyWith(color: AppColors.secondaryText))
            ]),
            style: Styles.headerNormal,
          ),
          const SizedBox(
            height: 16,
          ),
          ChefioSlider(
            values: const [10, 30, 60],
            onChanged: (value) {},
          )
        ],
      ),
    );

    final button = ChefioButton(
      text: Strings.next,
      onPressed: () => context.push(RoutesPaths.addIngredients),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading:  ChefioButton(
          isTextButton: true,
          fillWidth: false,
          text: 'Cancel',
          textColor: AppColors.secondary,
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Text.rich(
              TextSpan(text: '1', style: Styles.headerNormal, children: [
                TextSpan(
                    text: '/2',
                    style: Styles.headerSmall
                        .copyWith(color: AppColors.secondaryText))
              ]),
            )),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              featureImage,
              const SizedBox(
                height: 24,
              ),
              form,
              const Spacer(),
              button,
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
