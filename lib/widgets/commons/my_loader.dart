import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const MyLoader({
    super.key,
    this.width = 80.0,
    this.height = 80.0,
    this.backgroundColor = Colors.transparent,
    this.progressColor = const Color.fromARGB(255, 33, 150, 243),
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      elevation: 0,
      content: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              progressColor,
            ),
          ),
        ),
      ),
    );
  }
}
