import 'package:wesave/ressource/export.dart';

//import 'package:provider/provider.dart';
class RouteAchatUser extends StatelessWidget {
  const RouteAchatUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    //print(user);
    //return Authentificate();
    if (user == null) {
      return ControlUser();
    } else {
      return AchatForm();
    }
  }
}