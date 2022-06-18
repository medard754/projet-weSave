
import 'package:wesave/ressource/export.dart';

class ControlUser extends StatefulWidget {
  ControlUser({Key? key}) : super(key: key);

  @override
  State<ControlUser> createState() => _ControlUserState();
}

class _ControlUserState extends State<ControlUser> {
   //renvoi vrai si user veut se connecter ou s'inscrire
  bool showSignin = true;
  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return SignIn(toggleView: toggleView);
    } else {
      return SignUp(toggleView:toggleView);
    }
  }
}