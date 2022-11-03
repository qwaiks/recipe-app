import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputField extends StatelessWidget {
  final Function(String?) onSaved;

  const OTPInputField({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.borderBolor,
      ),
    );

    return SizedBox(
      width: 72,
      height: 72,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          border: outlineBorder,
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder.copyWith(
              borderSide: outlineBorder.borderSide
                  .copyWith(width: 1.2, color: AppColors.mainText)),
        ),
        onSaved: onSaved,
        style: Styles.headerLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
