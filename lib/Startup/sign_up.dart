import 'package:wesave/ressource/export.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  bool loading = false;
  CustomTextfield email = CustomTextfield();
  CustomTextfield password = CustomTextfield();
  CustomTextfield password_confirm = CustomTextfield();
  CustomTextfield username = CustomTextfield();
  String error = '';
  String errorpwd = '';
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;
  String mail = '';
  String pwd = '';
  String c_pwd = "";
  String nom = "";
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/panier2.jpg"),
                    fit: BoxFit.cover)),
            child: _formbody(),
          ));
  }

  Widget _formbody() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Inscrivez-vous",
                style: TextStyle(
                    color: Couleur.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: "Montserrat"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              /*  Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/loginin.png"),
                        fit: BoxFit.contain)),
              ),*/
              SizedBox(height: 25),
              username.textFormField("Entrer votre nom", "entrer un nom valid",
                  2, 1, false, Icons.person, (e) {
                setState(() {
                  nom = e;
                });
              }),
              SizedBox(height: 12),
              email.textFormField(
                "Entrer votre mail",
                "entrer un email valid",
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
              password.textFormField(
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
              password_confirm.textFormField(
                "Confirmer votre password",
                "mot de passe invalid",
                2,
                1,
                false,
                Icons.vpn_key_rounded,
                (e) {
                  setState(() {
                    c_pwd = e;
                  });
                },
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      checkColor: color,
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
                  Text(
                    "Mot de passe oublié",
                    style: TextStyle(color: color, fontSize: 15),
                  )
                ],
              ),*/
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

                      dynamic result = await _authService
                          .signUpWitchEmailAndPassword(mail, pwd);

                     /* if (pwd.length < 8 ) {
                        error = "Entrer un mot de passe au moins 8 caractère";
                      } else {
                        
                      }*/
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
                  child: Text("s'inscrire",
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
                    "Vous avez déjà un compte?",
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
                      Get.to(SignIn(
                        toggleView: widget.toggleView,
                      ));
                    },
                    child: Text(
                      "sign_In",
                      style: TextStyle(
                        color: Couleur.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              /* RaisedButton.icon(
                  onPressed: () {
                    return NotificationApi.showNotification(
                        title: 'WeSave ', 
                        body: 'Bienvenue sur notre plateforme!!!, faites-vous plaisir en consultant nos produits', 
                        payload: 'wesave.abs',
                        sheduleDate: DateTime.now().add(Duration(seconds:12))
                        );
                        
                  },
                  icon: Icon(Icons.notifications_active_outlined),
                  label: Text("Notifications "))*/
            ],
          ),
        ));
  }
}
