import 'package:chefio/components/chefio_button.dart';
import 'package:chefio/config/colors.dart';
import 'package:chefio/config/strings.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/recipe_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          color: AppColors.secondary, shape: BoxShape.circle),
    );

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
                  style: Styles.headerLarge,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  e['title'].toString(),
                  style: Styles.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                  ),
                )
              ],
            ),
          )
          .toList(),
    );

    final followButton = ChefioButton(
      text: Strings.follow,
      fillWidth: false,
      onPressed: () {},
    );

    final recipeView = GridView.builder(
      itemCount: 3,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 310,
        childAspectRatio: 12,
      ),
      itemBuilder: (context, index) => RecipeTile(),
    );

    final likedView = GridView.builder(
      itemCount: 3,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 310,
        childAspectRatio: 12,
      ),
      itemBuilder: (context, index) => RecipeTile(),
    );

    const tabHeader = TabBar(
      tabs: [
        Tab(text: Strings.recipes),
        Tab(text: Strings.liked),
      ],
      indicatorColor: AppColors.primary,
      unselectedLabelColor: AppColors.secondaryText,
      labelColor: AppColors.mainText,
    );

    final tabView = TabBarView(
      children: [
        recipeView,
        likedView,
      ],
    );

    final profileHeader = SliverList(
        delegate: SliverChildListDelegate(
      [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Chcoirul Syafril',
                  style: Styles.headerNormal,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              stats,
              const SizedBox(
                height: 24,
              ),
              followButton
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 8,
          color: AppColors.form,
        ),
      ],
    ));

    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              profileHeader,
              SliverPersistentHeader(
                delegate: MyDelegate(tabHeader),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: tabView,
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
