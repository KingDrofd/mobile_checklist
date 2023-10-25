import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_checklist/config/color_switch.dart';
import 'package:mobile_checklist/utils/variables.dart';
import 'package:mobile_checklist/widgets/card_data.dart';
import 'package:mobile_checklist/widgets/card_details.dart';
import 'package:mobile_checklist/widgets/custom_card.dart' as customCard;
import 'package:mobile_checklist/widgets/sign_in.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  void initState() {
    super.initState();
  }

  void toggleColor() {
    setState(() {
      isCurrentColor = !isCurrentColor;
      updateColor();
      print(isCurrentColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shadows: <BoxShadow>[
            BoxShadow(
                offset: const Offset(0.0, 24.0),
                blurRadius: 50.0,
                spreadRadius: -3.0,
                color: Colors.black.withOpacity(.54)),
          ],
          shape: const StarBorder.polygon(sides: 6, pointRounding: .4),
        ),
        child: FloatingActionButton.large(
          backgroundColor: colorSwitch.currentColor1,
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: const StarBorder.polygon(sides: 6, pointRounding: .37),
          onPressed: () {
            toggleColor();
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailsAdd(),
                ),
              );
              print("id token is !!!!!!!:" + idToken);
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
