import 'package:country_code_picker/country_code_picker.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/Models/User.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final DatabaseService _databaseService = DatabaseService();
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
  var telephone;
  var Codetelephone;
  var Nompays;
  var pwd;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: new Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/img/panier2.jpg"),
            //         fit: BoxFit.cover)),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  defaultPadding,
                  defaultPadding,
                  MediaQuery.of(context).padding.bottom + defaultPadding),
              children: [_formbody()],
            ),
          ));
  }

  Widget _formbody() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8),
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
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un nom valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      nom = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Prénom",
                  placeholder: "Entrer votre prénom",
                  obscure: false,
                  err: "entrer un prénom valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un prénom valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      prenoms = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              IntlPhoneField(
                //disableLengthCheck: false,
                decoration: InputDecoration(
                  //color:Colors.white,
                  labelText: 'Numero de telephone',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black45),
                  ),
                ),
                validator: (e) {
                  if (e == null) {
                    return "entrer un numero valid";
                  }
                },
                onChanged: (phone) {
                  print(phone.completeNumber);
                  Nompays = phone.countryCode;
                  Codetelephone = phone.countryCode;
                  //telephone = phone.number;
                  setState(() {
                    telephone = phone.number;
                  });
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
                onSaved: (e) {
                  setState(() {
                    telephone = e?.number;
                  });
                },
              ),
              const SizedBox(height: defaultPadding),
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
                      mail = e;
                    });
                  },
                  icon: Icons.mail,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Mot de passe",
                  placeholder: "Entrer un mot de passe",
                  obscure: false,
                  err: "entrer un mot de passe valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un mot de passe valid";
                    } else {
                      if (e.length < 8) {
                        pwd = e;
                        return "Entrer un mot de passe au moins 8 caractère";
                      }
                      return null;
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      password = e;
                    });
                  },
                  icon: Icons.vpn_key_rounded,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Confirmer votre mot de passe",
                  placeholder: "Confirmer votre mot de passe",
                  obscure: false,
                  err: "entrer un mot de passe valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un nom valid";
                    } else {
                      if (e != password) {
                        return "entrer le password entrer en haut";
                      }
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      confirmpwd = e;
                    });
                  },
                  icon: Icons.vpn_key_rounded,
                  max: 2,
                  min: 1),
              SizedBox(height: 20),
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    /* _firebaseServices.UserDetails(
                        nom: nom,
                        prenoms: prenoms,
                        telephone: 97558241,
                        email: mail,
                        password: password);*/

                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        //loading = true;
                      });
                      final user = AppUser(
                          nom: nom,
                          prenoms: prenoms,
                          telephone: 90201107,
                          email: mail,
                          password: password);
                      dynamic result = await _authService
                          .signUpWitchEmailAndPassword(mail, password);
                      _databaseService.createUser(user: user);
                      // print(nom);
                      // print(prenoms);
                      // print(mail);
                      // print(password);
                      // print(confirmpwd);
                      // print(Codetelephone);
                      if (result == null) {
                        setState(() {
                          //error = "Please supply a valid email";
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
              /* Text(
                error,
                style: TextStyle(color: Colors.red),
              ),*/
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
