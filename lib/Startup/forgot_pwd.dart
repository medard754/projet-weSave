import 'package:wesave/ressource/export.dart';

class ForgotPwd extends StatefulWidget {
  ForgotPwd({Key? key}) : super(key: key);

  @override
  State<ForgotPwd> createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  bool loading = false;

  String error = '';
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;
  String email="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _formbody());
  }

  Widget _formbody() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(
                "Entrer le mail de récupération",
                style: TextStyle(
                    color: Couleur.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/pwd.png"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(height: 25),
              CustomInput(
                  title: "Email",
                  placeholder: "Entrer votre email",
                  obscure: false,
                  err: "entrer un email valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un email valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      email = e;
                    });
                  },
                  icon: Icons.mail,
                  max: 2,
                  min: 1),
              SizedBox(height: 20),
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("connexion valid");
                    }
                  },
                  child: Text("Soumettre",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"))),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }
}
