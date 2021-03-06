import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import '../../utils/text_style.dart';

class Loading extends StatelessWidget {
 // HexColor color = HexColor("#F04700");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height:MediaQuery.of(context).size.height*0.2,
            width:MediaQuery.of(context).size.width,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
               SpinKitPouringHourGlass(
        size: 55,
        color:Colors.green,
      ),
              const SizedBox(width:25,),
              Text(
                "Patientez un peu...",
                style: TextStyle(
                  color:Colors.black,
                  fontFamily:'Montserrat',
                  fontSize:16,
                  fontWeight:FontWeight.w700
                ),
              )
              ],
            ),
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
      ),
    );
  }
}
