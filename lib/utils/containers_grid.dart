import 'package:flutter/material.dart';
import 'package:mobile_checklist/config/color_switch.dart';
import 'package:mobile_checklist/utils/variables.dart';

class ContainerGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Number of columns
      ),
      itemCount: 10, // Total number of containers
      itemBuilder: (BuildContext context, int index) {
        // You can customize each container here
        return Container(
          color: colorSwitch.currentColor1, // Change the color as needed
          margin: EdgeInsets.all(8.0), // Add margin between containers
          child: Center(
            child: Text(
              'Container $index',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
