import 'package:chefio/config/strings.dart';
import 'package:chefio/config/svgs.dart';
import 'package:chefio/views/home/views/home.page.dart';
import 'package:chefio/views/home/views/notification.page.dart';
import 'package:chefio/views/home/views/profile.page.dart';
import 'package:chefio/views/recipe/create_recipe/create_recipe.dart';
import 'package:flutter/material.dart';

import 'components/bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': SVGS.icHome, 'title': Strings.home},
      {'icon': SVGS.icUpload, 'title': Strings.upload},
      {'icon': SVGS.icNotification, 'title': Strings.notification},
      {'icon': SVGS.icProfile, 'title': Strings.profile},
    ];

    final pages = [
      const HomePage(),
      const CreateRecipeScreen(),
      const NotificationPage(),
      const ProfilePage()
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: ChefioBottomNavigationBar(
        items: items,
        selectedIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}
