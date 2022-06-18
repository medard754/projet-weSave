import 'package:flutter/material.dart';
//import 'package:epicerie/utils/text_style.dart';

class CircularLoading extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double? value;

  const CircularLoading({
    Key? key,
    this.color = Colors.green,
    this.width = 30.0,
    this.height = 30.0,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(color),
        value: value,
      ),
      height: height,
      width: width,
    );
  }
}
