import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/colors.dart';
import '../config/strings.dart';
import '../config/style.dart';
import '../config/svgs.dart';

class ChefioImagePicker extends StatelessWidget {
  const ChefioImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [10, 5],
      borderType: BorderType.RRect,
      color: AppColors.borderBolor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      radius: const Radius.circular(13),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SvgPicture.asset(SVGS.icImage),
            const SizedBox(
              height: 16,
            ),
            const Text(
              Strings.addCoverPhoto,
              style: Styles.headerSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              Strings.imageUploadLimit,
              style: Styles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
