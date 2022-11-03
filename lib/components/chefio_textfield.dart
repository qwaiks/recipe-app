import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:chefio/config/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChefioTextField extends StatefulWidget {
  final String? hintText;
  final String? leadingIcon;
  final String? label;
  final TextInputType inputType;
  final bool outlined;
  final bool isPasswordField;
  final bool showSuffix;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validators;
  final Function(String?)? onChanged;

  const ChefioTextField(
      {super.key,
      this.hintText,
      this.leadingIcon,
      this.outlined = false,
      this.isPasswordField = false,
      this.showSuffix = false,
      this.inputType = TextInputType.text,
      this.validators,
      this.onChanged,
      this.controller,
      this.label,
      this.minLines,
      this.maxLines = 1});

  @override
  State<ChefioTextField> createState() => _ChefioTextFieldState();
}

class _ChefioTextFieldState extends State<ChefioTextField> {
  bool _obscureText = true;
  bool _showClearSuffix = false;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(
        width: widget.outlined ? 1.0 : 0.0,
        color: AppColors.borderBolor,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: widget.hintText,
      hintStyle: Styles.bodyNormal.copyWith(
        color: AppColors.hintTextColor,
      ),
      prefixIconConstraints: BoxConstraints.tight(
        const Size(60, 24),
      ),
      prefixIcon: (widget.leadingIcon != null)
          ? SvgPicture.asset(widget.leadingIcon!)
          : null,
      suffixIconConstraints: BoxConstraints.tight(
        const Size(60, 24),
      ),
      suffixIcon: widget.isPasswordField
          ? _buildPasswordFieldVisibilityToggle()
          : _showClearSuffix
              ? _defaultSuffixToogle()
              : null,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      filled: !widget.outlined,
      fillColor: AppColors.form,
      enabledBorder: border,
      border: border,
      focusedBorder: !widget.outlined
          ? border
          : border.copyWith(
              borderSide: border.borderSide.copyWith(
              color: AppColors.mainText,
              width: 1,
            )),
      errorBorder: !widget.outlined
          ? border
          : border.copyWith(
              borderSide: border.borderSide.copyWith(
                color: AppColors.secondary,
              ),
            ),
    );

    final label = Text(widget.label!, style: Styles.headerNormal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != null ? label : const SizedBox(),
        SizedBox(
          height: widget.label != null ? 10 : 0,
        ),
        TextFormField(
          controller: _controller,
          keyboardType: widget.inputType,
          decoration: inputDecoration,
          validator: widget.validators,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          obscureText: widget.isPasswordField ? _obscureText : false,
          cursorColor: AppColors.primary,
          onChanged: widget.showSuffix ? onChangeAltered : widget.onChanged,
          style: Styles.headerNormal,
        )
      ],
    );
  }

  onChangeAltered(String? value) {
    setState(() {
      _showClearSuffix = value != null && value.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  Widget _defaultSuffixToogle() {
    return InkWell(
      onTap: () {
        _controller!.clear();
        onChangeAltered(_controller!.text);
      },
      radius: 30,
      child: SvgPicture.asset(SVGS.icClose),
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: SvgPicture.asset(
        _obscureText ? SVGS.icPasswordVisible : SVGS.icPasswordHidden,
      ),
    );
  }
}
