import 'package:chefio/views/dashboard/components/scan.bs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/colors.dart';
import '../../../config/strings.dart';
import '../../../config/style.dart';
import '../../../config/svgs.dart';
import 'bottom_navigation_item.dart';

class ChefioBottomNavigationBar extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(int) onTap;
  final int selectedIndex;

  const ChefioBottomNavigationBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final middleOption = Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.65,
      child: InkWell(
        onTap: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Stack(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            child: Icon(
                              Icons.close,
                              color: AppColors.mainText,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Choose one option',
                            style: Styles.headerNormal,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const ScanBottomSheet(),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            }),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(15),
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
        selectedIndex == 1 ? const SizedBox() : middleOption,
      ],
    );
  }
}
