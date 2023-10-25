import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final Color? activeColor;
  final Color? thumbColor;

  const SliderWidget({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    this.activeColor,
    this.thumbColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Slider(
        value: value,
        activeColor: activeColor,
        thumbColor: thumbColor,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: (max - min).toInt(),
        label: value.round().toString(),
      ),
    );
  }
}
