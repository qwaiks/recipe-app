import 'package:chefio/config/theme.dart';
import 'package:chefio/views/create_recipe/add_ingredients.dart';
import 'package:chefio/views/home/dashboard.screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefio',
      theme: Themes.defaultTheme,
      home: DashboardScreen(),
    );
  }
}
