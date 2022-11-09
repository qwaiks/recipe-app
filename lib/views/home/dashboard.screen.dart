import 'dart:developer';

import 'package:chefio/config/colors.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:chefio/views/home/views/home.page.dart';
import 'package:chefio/views/home/views/notification.page.dart';
import 'package:chefio/views/home/views/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      Container(),
      const NotificationPage(),
      const ProfilePage()
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class BottomNavigationBar extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(int) onTap;
  final int selectedIndex;

  const BottomNavigationBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final middleOption = Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.65,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              SVGS.icScan,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            Strings.scan,
            style: Styles.bodySmall.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );

    final List<Widget> pages = [
      for (int i = 0; i < items.length; i++)
        BottomItem(
          icon: items[i]['icon']!,
          title: items[i]['title']!,
          selected: i == selectedIndex,
          index: i,
          onTap: onTap,
        )
    ];
    pages.insert(
        2,
        const SizedBox(
          width: 70,
        ));
    return Stack(
      children: [
        Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pages,
          ),
        ),
        middleOption,
      ],
    );
  }
}

class BottomItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool selected;
  final int index;
  final Function(int) onTap;

  const BottomItem({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              color: selected ? AppColors.primary : AppColors.secondaryText,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Styles.bodySmall.copyWith(
                  color:
                      selected ? AppColors.primary : AppColors.secondaryText),
            )
          ],
        ),
      ),
    );
  }
}
