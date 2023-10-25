import 'package:flutter/material.dart';
import 'package:mobile_checklist/config/color_switch.dart';

class RGBColor {
  int red;
  int green;
  int blue;

  RGBColor({required this.red, required this.green, required this.blue});
}

List<bool> isCheckedList = List.generate(3, (index) => false);
List<String> customNames = List.generate(3, (index) => 'Item $index');
TextEditingController customNameController = TextEditingController();

// RGBColor rgbColor = RGBColor(red: 235, green: 143, blue: 143);
RGBColor rgbColor1 = RGBColor(red: 235, green: 143, blue: 143);
RGBColor rgbColor2 = RGBColor(red: 143, green: 235, blue: 143);
// RGBColor buttonColor = RGBColor(red: 235, green: 143, blue: 143);

bool isColor1Selected = true; // Start with the first color selected
bool isCurrentColor = false;
void updateColor() {
  colorSwitch.updateColor(rgbColor1, 1);

  colorSwitch.updateColor(rgbColor2, 2);
}
