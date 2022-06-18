import 'package:wesave/ressource/export.dart';
import 'package:wesave/widgets/loader/loadingspinning.dart';



class Start extends StatefulWidget {
  Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final int delay=5000;
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed( Duration(milliseconds: delay), () {});
    Navigator.pushNamed(context,'/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: double.maxFinite,
          child: Stack(
            alignment:Alignment.center,
            children: [
               Align(
                alignment:FractionalOffset.center,
                child:Container(
                  height:150,
                  width:200,
                  decoration:BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/img/logo.jpeg"),
                      fit: BoxFit.contain
                    )
                  ),
                )
              ),
               Positioned(
                bottom: 0.0,
                child: Align(
                  alignment:FractionalOffset.bottomCenter,
                  child:Spinning()
                )
              )
            ],
          ),
        ),
      )
    );
  }
}