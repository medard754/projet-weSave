
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:epicerie/utils/text_style.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/widgets/loader/index.dart';
class Spinning extends StatelessWidget {
  
//HexColor color = HexColor("#F04700");
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SpinKitSpinningLines(
        size:55,
        color:Colors.green,
      )
    );
  }
}