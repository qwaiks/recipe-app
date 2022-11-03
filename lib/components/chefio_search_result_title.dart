import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioSearchResultTile extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ChefioSearchResultTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(SVGS.clock),
      title: Text(text),
      trailing: SvgPicture.asset(SVGS.arrowUpward),
      onTap: onTap,
    );
  }
}
