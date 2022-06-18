import 'package:wesave/ressource/export.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(ControlUser());
          },
          child: Text("Welcome to homepage on WeSave",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800)),
        ),
      ),
    ));
  }
}
