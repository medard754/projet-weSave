import 'package:wesave/Home/home.dart';
import 'package:wesave/ressource/export.dart';

class PaiementForm extends StatefulWidget {
  PaiementForm({Key? key}) : super(key: key);

  @override
  State<PaiementForm> createState() => _PaiementFormState();
}

class _PaiementFormState extends State<PaiementForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/lo.jpeg"),
                    fit: BoxFit.contain),
                border: Border.all(
                    style: BorderStyle.solid, width: 1, color: Colors.black12)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 17)),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Color.fromARGB(31, 7, 2, 2),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      minWidth: 150,
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      color: Couleur.color,
                      onPressed: () async {
                        showDialogFuncUser(context);
                      },
                      child: Text("Valider",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"))),
                  FlatButton(
                      minWidth: 150,
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      color: Colors.black12,
                      onPressed: () async {
                        Get.to(HomePage());
                        setState(() {});
                      },
                      child: Text("Annuler",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"))),
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    style: BorderStyle.solid, width: 1, color: Colors.black12)),
          )
        ]),
      ),
    );
  }

  showDialogFuncUser(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.error_outline, color: Couleur.color),
                        iconSize: 45,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Commande éffectuée continuer"),
                      //Text(uid),
                      const SizedBox(height: 8),
                      FlatButton(
                          minWidth: 150,
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          color: Couleur.color,
                          onPressed: () async {
                            Get.to(HomePage());
                          },
                          child: Text("okey",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat"))),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
