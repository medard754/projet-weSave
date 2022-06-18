import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Fadding extends StatelessWidget {
  const Fadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
        size:55, color: Color.fromARGB(255, 26, 175, 155));
  }
}
