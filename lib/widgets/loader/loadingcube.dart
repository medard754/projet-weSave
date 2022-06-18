import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Wander extends StatelessWidget {
  const Wander({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SpinKitWanderingCubes(
        size: 55,
        color: Color.fromARGB(255, 27, 165, 147)
      ),
    );
  }
}