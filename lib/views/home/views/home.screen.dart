import 'package:flutter/material.dart';

import '../../../components/recipe_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 310),
      itemBuilder: (context, index) => RecipeTile(),
    );
  }
}
