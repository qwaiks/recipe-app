import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/style.dart';

class ChefioSlider extends StatefulWidget {
  final List<double> values;
  final ValueChanged<double>? onChanged;
  const ChefioSlider({super.key, required this.values, this.onChanged});

  @override
  State<ChefioSlider> createState() => _ChefioSliderState();
}

class _ChefioSliderState extends State<ChefioSlider> {
  late double _value;
  late List<double> _values;

  @override
  void initState() {
    super.initState();
    _values = widget.values;
    _value = widget.values.first;
  }

  @override
  Widget build(BuildContext context) {
    final labels = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.values.map((e) {
        String str = (e == _values.first)
            ? '<'
            : (e == _values.last)
                ? '>'
                : '';

        String text = str + e.toInt().toString();

        return Text(
          text,
          style: Styles.headerSmall.copyWith(
            color: _value >= e.toDouble()
                ? AppColors.primary
                : AppColors.secondaryText,
          ),
        );
      }).toList(),
    );

    final slider = SliderTheme(
      data: SliderThemeData(
        trackHeight: 3,
        activeTickMarkColor: AppColors.primary,
        inactiveTickMarkColor: AppColors.form,
        trackShape: SliderCustomTrackShape(),
        thumbColor: AppColors.primary,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.form,
      ),
      child: Slider(
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        },
        min: _values.first,
        max: _values.last,
        divisions: widget.values.length - 1,
      ),
    );

    return Column(
      children: [
        labels,
        const SizedBox(
          height: 16,
        ),
        slider
      ],
    );
  }
}

class SliderCustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
