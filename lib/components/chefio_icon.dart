import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioIcon extends StatelessWidget {
  final String svgIcon;
  final Function() onTap;
  const ChefioIcon({super.key, required this.svgIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(70),
      child: SizedBox(
        width: 35,
        height: 35,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SvgPicture.asset(
                svgIcon,
                height: 15,
                width: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
