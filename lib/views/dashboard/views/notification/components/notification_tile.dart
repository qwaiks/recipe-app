import 'package:chefio/config/colors.dart';
import 'package:chefio/config/imgs.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

enum NotificationType { follow, like }

class NotificationTile extends StatelessWidget {
  final String title;
  final String time;
  final NotificationType type;
  final bool followed;

  const NotificationTile(
      {super.key,
      required this.title,
      required this.time,
      required this.type,
      required this.followed});

  @override
  Widget build(BuildContext context) {
    final avatar = ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        Imgs.dummyAvatar1,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );

    final trailing = NotificationType.like == type
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Imgs.dummyFeatured,
              width: 64,
              height: 64,
            ),
          )
        : Chip(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            backgroundColor: followed ? AppColors.form : AppColors.primary,
            label: Text(
              followed? Strings.followed: Strings.follow ,
              style: Styles.bodySmall.copyWith(
                color: followed ? AppColors.mainText : Colors.white,
              ),
            ),
          );

    final subtitle = NotificationType.follow == type
        ? 'Now following you'
        : 'like your recipe';

    final content = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              title,
              style: Styles.headerSmall,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Flexible(
            child: Text.rich(
              TextSpan(
                text: subtitle,
                children: const [
                  TextSpan(text: '• 1h'),
                ],
              ),
              style: Styles.bodySmall.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          )
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          avatar,
          const SizedBox(
            width: 16,
          ),
          content,
          const SizedBox(
            width: 16,
          ),
          trailing
        ],
      ),
    );
  }
}
