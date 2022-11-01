import 'package:chefio/config/colors.dart';
import 'package:chefio/config/style.dart';
import 'package:flutter/material.dart';

class ChefioSelectionChip extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onSelectionChange;
  final bool isLinear;
  final String initialSelected;
  final Color activeColor, inActiveColor;
  final bool isOutlined;

  const ChefioSelectionChip({
    super.key,
    required this.items,
    required this.onSelectionChange,
    required this.initialSelected,
    this.isOutlined = false,
    this.isLinear = false,
    this.activeColor = AppColors.primary,
    this.inActiveColor = AppColors.form,
  });

  @override
  State<ChefioSelectionChip> createState() => _ChefioSelectionChipState();
}

class _ChefioSelectionChipState extends State<ChefioSelectionChip> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    final chips = widget.items
        .map((e) => ChefioChip(
            label: e,
            onTap: (e) {
              setState(() {
                _selectedItem = e;
              });
            },
            isOutlined: widget.isOutlined,
            activeColor: widget.activeColor,
            inActiveColor: widget.inActiveColor,
            selectedItem: _selectedItem))
        .toList();

    return !widget.isLinear
        ? Wrap(
            children: chips,
          )
        : SizedBox(
            height: 75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: chips,
            ),
          );
  }
}

class ChefioChip extends StatelessWidget {
  final String label;
  final ValueChanged<String> onTap;
  final Color activeColor, inActiveColor;
  final String? selectedItem;
  final bool isOutlined;

  const ChefioChip(
      {super.key,
      required this.label,
      required this.onTap,
      required this.activeColor,
      required this.inActiveColor,
      required this.selectedItem,
      this.isOutlined = false});

  @override
  Widget build(BuildContext context) {
    final isActive = label == selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        radius: 32,
        onTap: () => onTap(label),
        child: Chip(
          labelPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
          label: Text(label),
          labelStyle: isActive
              ? Styles.bodyLagre.copyWith(color: Colors.white)
              : Styles.bodyNormal.copyWith(color: AppColors.secondaryText),
          side: BorderSide(
              width: isActive
                  ? 0
                  : isOutlined
                      ? 2
                      : 0,
              color: isOutlined ? AppColors.outline : Colors.transparent),
          backgroundColor: isActive
              ? activeColor
              : isOutlined
                  ? Colors.transparent
                  : inActiveColor,
        ),
      ),
    );
  }
}
