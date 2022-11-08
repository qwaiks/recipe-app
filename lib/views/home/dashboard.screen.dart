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


    final homeIcon = BottomItem(
      icon: SVGS.icHome,
      title: Strings.home,
      selected: true,
    );

    final uploadIcon = BottomItem(
      icon: SVGS.icUpload,
      title: Strings.upload,
      selected: false,
    );

    final notificationIcon = BottomItem(
      icon: SVGS.icNotification,
      title: Strings.notification,
      selected: false,
    );

    final profileIcon = BottomItem(
      icon: SVGS.icProfile,
      title: Strings.profile,
      selected: false,
    );

    final pages = [
      const HomePage(),
      Container(),
      const NotificationPage(),
      const ProfilePage()
    ];

    final middleOption = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
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
          height: 8,
        ),
        Text(
          Strings.scan,
          style: Styles.bodySmall.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homeIcon,
          uploadIcon,
          middleOption,
          notificationIcon,
          profileIcon
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool selected;
  final int index;
  final Function onTap;

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
    return MaterialButton(
      onPressed: () => onTap,
      minWidth: 44,
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
                color: selected ? AppColors.primary : AppColors.secondaryText),
          )
        ],
      ),
    );
  }
}
