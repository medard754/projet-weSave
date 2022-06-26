import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesave/Home/dashboard/client/createform.dart';
import 'package:wesave/ressource/export.dart';
import '../../../widgets/loader/PourHourGring.dart';

class ReadClient extends StatefulWidget {
  ReadClient({Key? key}) : super(key: key);

  @override
  State<ReadClient> createState() => _ReadClientState();
}

class _ReadClientState extends State<ReadClient> {
  final DatabaseService _databaseService = DatabaseService();
  final CollectionReference _collectionReferenceCategorie =
      FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionusers =
      FirebaseFirestore.instance.collection('client');
  final CollectionReference _collectionReferenceClient =
      FirebaseFirestore.instance.collection('client');
  AppUser us = AppUser();
  List<dynamic> users = [];
  List<String> user = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    final userRef = FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    dynamic result = userRef.get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          users.add(element.data());
          user.add(element.reference.id.toString());
          // users = element.data();
        });
        setState(() {});
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      //setState(() {});
                      dynamic uid = users[index].nom;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Nom: " + users[index].nom.toString()),
                                    const SizedBox(height: defaultPadding - 8),
                                    Text("Prénoms: " +
                                        users[index].prenoms.toString()),
                                    const SizedBox(height: defaultPadding - 8),
                                    Text("Téléphone" +
                                        users[index].telephone.toString()),
                                    const SizedBox(height: defaultPadding - 8),
                                    Text("Adresse: " +
                                        users[index].adresse.toString()),
                                    const SizedBox(height: defaultPadding - 8),
                                    Text("Email: " +
                                        users[index].email.toString()),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Actions",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit,
                                              color: Colors.blue),
                                          iconSize: 22,
                                        )),
                                        GestureDetector(
                                            child: IconButton(
                                          onPressed: () {
                                            print(user[index]);
                                            var indice = user[index];
                                            showDialogFuncUser(
                                                context, index, indice);
                                          },
                                          icon: Icon(Icons.delete,
                                              color: Colors.redAccent),
                                          iconSize: 22,
                                        )),
                                      ],
                                    )
                                  ],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromARGB(9, 0, 0, 0))),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1,
                                  color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }),
              ),
              //Get.to(CreateClient());
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    Get.to(CreateClient());
                  },
                  child: Text("Créer un client",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"))),
            ],
          ),
        ),
      ),
    );
  }

  //Fonction dialog Supprimer un element
  showDialogFuncUser(context, var index, var indice) {
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
                        icon:
                            Icon(Icons.error_outline, color: Colors.redAccent),
                        iconSize: 45,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Voulez-vous vraiment supprimer cet utilisateur"),
                      //Text(uid),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                              minWidth: 150,
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              color: Colors.redAccent,
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(indice)
                                    .delete();
                                Get.back();
                                setState(() {});
                              },
                              child: Text("oui",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat"))),
                          FlatButton(
                              minWidth: 150,
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              color: Colors.black12,
                              onPressed: () async {
                                Get.back();
                                setState(() {});
                              },
                              child: Text("Non",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat"))),
                        ],
                      )
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
