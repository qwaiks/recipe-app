import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/style.dart';

class BottomSheetContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const BottomSheetContainer(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
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
            children: [
              const Align(
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
                  title,
                  style: Styles.headerNormal,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          child,
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
