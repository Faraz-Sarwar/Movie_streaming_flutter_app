import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double widht;
  final Widget child;
  const CustomContainer({
    super.key,
    required this.height,
    required this.widht,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: height,
      width: widht,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
