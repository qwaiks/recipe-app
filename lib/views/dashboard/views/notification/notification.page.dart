import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/views/dashboard/views/notification/components/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: ListView(
        children: const [
          Text(
            Strings.newText,
            style: Styles.headerNormal,
          ),
          SizedBox(
            height: 16,
          ),
          NotificationTile(
              title: 'Dean Winchester',
              time: '1h',
              type: NotificationType.follow,
              followed: false),
          NotificationTile(
              title: 'Amy green and Sam Winchester',
              time: '20m',
              type: NotificationType.like,
              followed: false),
          Text(
            Strings.today,
            style: Styles.headerNormal,
          ),
          SizedBox(
            height: 16,
          ),
          NotificationTile(
              title: 'Jake blue',
              time: '1h',
              type: NotificationType.follow,
              followed: true),
          NotificationTile(
              title: 'John Evans and Slat Qward',
              time: '20m',
              type: NotificationType.like,
              followed: false),
          NotificationTile(
              title: 'Mosis Simeon',
              time: '1h',
              type: NotificationType.follow,
              followed: false),
          Text(
            Strings.yesterday,
            style: Styles.headerNormal,
          ),
          SizedBox(
            height: 16,
          ),
          NotificationTile(
              title: 'Randy Turnd',
              time: '1h',
              type: NotificationType.follow,
              followed: false),
          NotificationTile(
              title: 'Josh Rant and Sam Everly',
              time: '1h',
              type: NotificationType.like,
              followed: true),
        ],
      ),
    );
  }
}
