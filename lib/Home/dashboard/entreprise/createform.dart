import 'package:country_code_picker/country_code_picker.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/Models/User.dart';

class CreateEntreprise extends StatefulWidget {
  CreateEntreprise({Key? key}) : super(key: key);

  @override
  State<CreateEntreprise> createState() => _CreateEntrepriseState();
}

class _CreateEntrepriseState extends State<CreateEntreprise> {
//à modifier

  final AuthService _authService = AuthService();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final DatabaseService _databaseService = DatabaseService();
  final Entreprise _entreprise = Entreprise();
  bool loading = false;
  String error = '';
  String errorpwd = '';
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;
  String mail = "";
  String nom = "";
  String siege = "";
  String adresse = "";
  String telephone = "";
  String password = "";
  String confirmpwd = "";
  int ifu = 0;

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
                "Créer une entreprise",
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
              SizedBox(height: 25),
              CustomInput(
                  title: "Nom ",
                  placeholder: "Entrer le nom",
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
                  title: "Siège",
                  placeholder: "Entrer le siege",
                  obscure: false,
                  err: "entrer un siege valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un siege valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      siege = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Adresse",
                  placeholder: "Entrer l'adresse",
                  obscure: false,
                  err: "entrer une adresse valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un adresse valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      adresse = e;
                    });
                  },
                  icon: Icons.mail,
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
                    //telephone = e?.number;
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
                  title: "Ifu",
                  placeholder: "Entrer votre ifu",
                  obscure: false,
                  err: "entrer un numero ifu valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un numero ifu valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      ifu = int.parse(e);
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
                        password = e;
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
                  title: "Confirmer le mot de passe",
                  placeholder: "Confirmer le mot de passe",
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
              const SizedBox(height: defaultPadding),
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
                      var value = 1;
                      print(nom);
                      print(siege);
                      print(adresse);
                      print(mail);
                      print(telephone);
                      print(ifu);
                      final entreprise = Entreprise(
                          nom: nom,
                          adresse: adresse,
                          telephone: "+2359874562",
                          email: mail,
                          siege: siege,
                          ifu: ifu,
                          value: value);
                      dynamic result = await _authService
                          .signUpWitchEmailAndPassword(mail, password);
                      _entreprise.createEntreprise(entreprise: entreprise);
                      // final user = AppUser(
                      //     nom: nom,
                      //     prenoms: prenoms,
                      //     telephone: 90201107,
                      //     email: mail,
                      //     password: password);

                    }
                  },
                  child: Text("Enrégistré l'entreprise",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"))),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
