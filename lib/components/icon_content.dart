import 'package:flutter/material.dart';
import '../constants.dart';


class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.labelText,required this.iconColor})
      : super(key: key);

  final IconData icon;
  final String labelText;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        const SizedBox(height: 15.0),
        Text(
          labelText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
