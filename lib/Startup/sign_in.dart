

import 'package:wesave/ressource/export.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});
  
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  CustomTextfield mail = CustomTextfield();
  CustomTextfield pwd = CustomTextfield();

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;
  
  @override
  Widget build(BuildContext context) {
    return loading
      ? Loading()
      :Scaffold(
       body: new Container(
            decoration:BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/img/panier5.jpg"),
                fit:BoxFit.cover
              )
            ),
            child: _formbody(),
          )
      );
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
              /*Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/loginup.png"),
                        fit: BoxFit.contain)),
              ),*/
              Text(
                "Connexion",
                style: TextStyle(
                    color: Couleur.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              mail.textFormField(
                "Entrer votre mail",
                "entrer un mail valid",
                2,
                1,
                false,
                Icons.mail,
                (e) {
                  setState(() {
                    email = e;
                  });
                },
              ),
              SizedBox(height: 12),
              pwd.textFormField(
                "Entrer votre password",
                "mot de passe invalid",
                2,
                1,
                false,
                Icons.vpn_key_rounded,
                (e) {
                  setState(() {
                    password = e;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      checkColor: Couleur.color,
                      value: isValue,
                      onChanged: (bool? value) {
                        setState(() {
                          isValue = value!;
                        });
                      }),
                  Text("Remember me"),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgotPwd());
                    },
                    child: Text(
                      "Mot de passe oublié",
                      style: TextStyle(color: Couleur.color, fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                                  loading = true;
                                });
                      dynamic result = await _authService.signInAnon();
                          
                      print("connexion etablie");
                      print(result);

                      if (result == null) {
                        setState(() {
                              error = "Please supply a valid email";
                            loading = false;
                            });
                      } else {
                        print("Register");
                        print(result);
                        print("connexion valid");
                      }
                    }
                  },
                  child: Text("Se connecter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"))),
                    SizedBox(
                          height: 12.0,
                        ),
                        Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous n'avez pas de compte?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignUp(toggleView: widget.toggleView,));
                    },
                    child: Text(
                      "Inscrivez-vous",
                      style: TextStyle(
                        color: Couleur.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
