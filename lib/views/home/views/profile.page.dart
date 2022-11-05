import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Container();

    final stats = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        {'title': 'Recipes', 'count': 32},
        {'title': 'Following', 'count': 782},
        {'title': 'Followers', 'count': 1287},
      ]
          .map(
            (e) => Column(
              children: [
                Text(
                  e['count'].toString(),
                  style: Styles.bodyLagre,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  e['title'].toString(),
                  style: Styles.bodySmall,
                )
              ],
            ),
          )
          .toList(),
    );

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(SVGS.share),
        ),
        const SizedBox(
          height: 20,
        ),
        profileImage,
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Choirul Syafril',
          style: Styles.headerNormal,
        ),
         const SizedBox(
          height: 24,
        ),
        stats,

      ],
    );
  }
}
