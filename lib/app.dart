import 'package:chefio/config/theme.dart';
import 'package:chefio/views/recipe/recipe_details/recipe_details.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefio',
      theme: Themes.defaultTheme,
      home: RecipeDetailsScreen(),
    );
  }
}
