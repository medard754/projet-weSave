import 'package:wesave/ressource/export.dart';

class CreateCategorie extends StatefulWidget {
  CreateCategorie({Key? key}) : super(key: key);

  @override
  State<CreateCategorie> createState() => _CreateCategorieState();
}

class _CreateCategorieState extends State<CreateCategorie> {
  final AuthService _authService = AuthService();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final DatabaseService _databaseService = DatabaseService();
  final Categorie _categorie = Categorie();
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;

  String libelle = "";
  String description = "";
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
                "Créer une catégorie",
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
              const SizedBox(height: defaultPadding + 5),
              CustomInput(
                  title: "Nom categorie",
                  placeholder: "Entrer votre categorie",
                  obscure: false,
                  err: "entrer une categorie",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un nom valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      libelle = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding + 5),
              CustomInput(
                  title: "Description",
                  placeholder: "Entrer la description",
                  obscure: false,
                  err: "remplissez le champ",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "remplissez le champ";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      description = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
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
                      print(libelle);
                      print(description);
                      final categorie =
                          Categorie(libelle: libelle, description: description);
                      _categorie.createCategorie(categorie: categorie);
                      // final user = AppUser(
                      //     nom: nom,
                      //     prenoms: prenoms,
                      //     telephone: 90201107,
                      //     email: mail,
                      //     password: password);

                    }
                  },
                  child: Text("Créer une catégorie",
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
