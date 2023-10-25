import 'package:flutter/material.dart';
import 'package:mobile_checklist/utils/variables.dart';
import 'package:mobile_checklist/widgets/slider_widget.dart';

class ColorSliders extends StatelessWidget {
  final RGBColor rgbColor;
  final ValueChanged<RGBColor> onChanged;

  const ColorSliders({
    super.key,
    required this.rgbColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SliderWidget(
          min: 143,
          max: 235,
          label: 'Red',
          value: rgbColor.red.toDouble(),
          onChanged: (newValue) {
            final newRgbColor = RGBColor(
                red: newValue.toInt(),
                green: rgbColor.green,
                blue: rgbColor.blue);
            onChanged(newRgbColor);
          },
          activeColor: Color.fromRGBO(210, 143, 143, 1),
          thumbColor: Color.fromRGBO(235, 143, 143, 1),
        ),
        SliderWidget(
          min: 143,
          max: 235,
          label: 'Green',
          activeColor: Color.fromRGBO(143, 205, 143, 1),
          thumbColor: Color.fromRGBO(143, 235, 143, 1),
          value: rgbColor.green.toDouble(),
          onChanged: (newValue) {
            final newRgbColor = RGBColor(
                red: rgbColor.red,
                green: newValue.toInt(),
                blue: rgbColor.blue);
            onChanged(newRgbColor);
          },
        ),
        SliderWidget(
          min: 143,
          max: 235,
          label: 'Blue',
          value: rgbColor.blue.toDouble(),
          onChanged: (newValue) {
            final newRgbColor = RGBColor(
                red: rgbColor.red,
                green: rgbColor.green,
                blue: newValue.toInt());
            onChanged(newRgbColor);
          },
          activeColor: Color.fromRGBO(143, 143, 205, 1),
          thumbColor: Color.fromRGBO(143, 143, 235, 1),
        ),
        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
