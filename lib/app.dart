import 'package:chefio/config/router.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: Strings.appName,
      theme: Themes.defaultTheme,
    );
  }
}
