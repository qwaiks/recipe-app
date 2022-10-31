import 'package:chefio/components/otp_input_field.dart';
import 'package:flutter/material.dart';

class ChefioOTPForm extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ChefioOTPForm({
    super.key,
    required this.onChanged,
  });

  @override
  State<ChefioOTPForm> createState() => _ChefioOTPFormState();
}

class _ChefioOTPFormState extends State<ChefioOTPForm> {
  List<String?> otpList = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    final inputField1 = OTPInputField(onSaved: (pin) {
      if (pin == null || pin.isEmpty) {
        otpList[0] = null;
      } else {
        otpList[0] = pin;
      }
      checkValue(otpList);
    });
    final inputField2 = OTPInputField(onSaved: (pin) {
      if (pin == null || pin.isEmpty) {
        otpList[1] = null;
      } else {
        otpList[1] = pin;
      }
      checkValue(otpList);
    });
    final inputField3 = OTPInputField(onSaved: (pin) {
      if (pin == null || pin.isEmpty) {
        otpList[2] = null;
      } else {
        otpList[2] = pin;
      }
      checkValue(otpList);
    });
    final inputField4 = OTPInputField(onSaved: (pin) {
      if (pin == null || pin.isEmpty) {
        otpList[3] = null;
      } else {
        otpList[3] = pin;
      }
      checkValue(otpList);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [inputField1, inputField2, inputField3, inputField4],
    );
  }

  checkValue(List<String?> x) {
    if (!x.contains(null)) {
      final output = x.reduce((value, element) => value! + element!);
      widget.onChanged(output!);
    }
  }
}
