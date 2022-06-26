import 'package:wesave/Home/dashboard/produit.dart/paiement.form.dart';
import 'package:wesave/ressource/export.dart';

class Commander extends StatefulWidget {
  Commander({Key? key}) : super(key: key);

  @override
  State<Commander> createState() => _CommanderState();
}

class _CommanderState extends State<Commander> {
  final AuthService _authService = AuthService();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  var telephone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  defaultPadding,
                  defaultPadding,
                  MediaQuery.of(context).padding.bottom + defaultPadding),
              children: [_formbody()],
            ),
      );
  }

  Widget _formbody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/cm.png"),
                    fit: BoxFit.contain)),
          ),
          Text("Entrer le numero MobileMoney",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 18)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntlPhoneField(
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

                setState(() {
                  telephone = phone.completeNumber;
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                minWidth: double.infinity,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                color: Couleur.color,
                onPressed: () async {
                   Get.to(PaiementForm());
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      //loading = true;
                    });
                    Get.to(PaiementForm());
                  }
                },
                child: Text("Valider",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat"))),
          ),
        ],
      ),
    );
  }
}
