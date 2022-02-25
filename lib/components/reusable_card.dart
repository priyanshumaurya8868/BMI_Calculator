import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.cardColor, this.child, this.onTap})
      : super(key: key);

  final Color cardColor;
  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: child,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
