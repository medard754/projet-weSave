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
  String error = '';
  String errorpwd = '';
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;
  String mail = "";
  String password = "";
  String confirmpwd = "";
  String nom = "";
  String prenoms = "";
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
              CustomInput(
                title: "Username", 
                placeholder: "Entrer votre nom", 
                obscure: false, 
                err: "entrer un nom valid", 
                validator: (e){}, 
                onSaved: (e){
                  setState(() {
                  nom = e;
                });
                }, 
                icon: Icons.person, max: 2, min: 1),
              SizedBox(height: 25),
              CustomInput(
                title: "Prénom", 
                placeholder: "Entrer votre prénom", 
                obscure: false, 
                err: "entrer un nom valid", 
                validator: (e){}, 
                onSaved: (e){
                  setState(() {
                  prenoms = e;
                });
                }, 
                icon: Icons.person, max: 2, min: 1),
              SizedBox(height: 25),
              CustomInput(
                title: "Email", 
                placeholder: "Entrer votre email", 
                obscure: false, 
                err: "entrer un email valid", 
                validator: (e){}, 
                onSaved: (e){
                  setState(() {
                  mail = e;
                });
                }, 
                icon: Icons.mail , max: 2, min: 1),
              const SizedBox(height: 12),
              CustomInput(
                title: "Mot de passe", 
                placeholder: "Entrer un mot de passe", 
                obscure: false, 
                err: "entrer un mot de passe valid", 
                validator: (e){}, 
                onSaved: (e){
                  setState(() {
                  password = e;
                });
                }, 
                icon: Icons.vpn_key_rounded , max: 2, min: 1),
              const SizedBox(height: 12),
              CustomInput(
                title: "Confirmer votre mot de passe", 
                placeholder: "Confirmer votre mot de passe", 
                obscure: false, 
                err: "entrer un mot de passe valid", 
                validator: (e){}, 
                onSaved: (e){
                  setState(() {
                  confirmpwd = e;
                });
                }, 
                icon: Icons.vpn_key_rounded , max: 2, min: 1),
             
              SizedBox(height: 20),
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        //loading = true;
                      });
                      
                      dynamic result = await _authService
                          .signUpWitchEmailAndPassword(mail, password);
                    print(nom);
                    print(prenoms);
                    print(mail);
                    print(password);
                    print(confirmpwd);
                      /*  if (result == null) {
                          setState(() {
                            error = "Please supply a valid email";
                            loading = false;
                          });
                        } else {
                          print("Register");
                          print(result);
                          print("connexion valid");
                        }
                      */
                      
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
