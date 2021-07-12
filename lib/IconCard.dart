import 'package:flutter/material.dart';
import 'Constants.dart';

class reusableIconText extends StatelessWidget {
  reusableIconText({this.name, this.icon});
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          name,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
