import 'package:wesave/ressource/export.dart';

class AchatForm extends StatefulWidget {
  AchatForm({Key? key}) : super(key: key);

  @override
  State<AchatForm> createState() => _AchatFormState();
}

class _AchatFormState extends State<AchatForm> {
  var toggleView;
  HexColor color = HexColor("#F04700");
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: color),
        centerTitle: true,
        title: Text("Achat Des Produits",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 17)),
        elevation: 0,
        actions: [
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("Logout"),
                  onPressed: () async {
                   // return await _authService.signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [Text("Remplisser le formulaire pour validé votre achat")],
      ),
    );
  }
}
