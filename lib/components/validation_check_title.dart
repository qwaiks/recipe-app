import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ValidationCheckTile extends StatelessWidget {
  final bool isValid;
  final String text;
  const ValidationCheckTile({super.key, required this.isValid, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(isValid ? SVGS.icValidationActive:SVGS.icValidationInactive),
        const SizedBox(width: 16,),
        Text(text,style: Styles.bodyNormal.copyWith(color: isValid? AppColors.mainText : AppColors.secondaryText )),
      ],
    );
  }
}
