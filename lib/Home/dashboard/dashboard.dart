import 'package:wesave/Home/dashboard/categorie/createform.dart';
import 'package:wesave/Home/dashboard/client/allform.dart';
import 'package:wesave/Home/dashboard/client/createform.dart';
import 'package:wesave/Home/dashboard/entreprise/createform.dart';
import 'package:wesave/Home/dashboard/produit.dart/createform.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/widgets/loader/PourHourGring.dart';

class Dashboard extends StatefulWidget {
  final String adminID;
  Dashboard({required this.adminID});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final CollectionReference _collectionReferenceClient =
      FirebaseFirestore.instance.collection('client');
  final CollectionReference _collectionReferenceAdmin =
      FirebaseFirestore.instance.collection('admin');
  final CollectionReference _collectionReferenceCategorie =
      FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionReferenceProduit =
      FirebaseFirestore.instance.collection('produit');
  final CollectionReference _collectionReferenceLivreur =
      FirebaseFirestore.instance.collection('commerce');
  final CollectionReference _collectionReferenceCommande =
      FirebaseFirestore.instance.collection('commander');
  final user = FirebaseAuth.instance.currentUser;
  var a, b, c, d, e, f;
  List<String> docIDsCommerce = [];
  List<String> docIDsCategorie = [];
  List<String> docIDsProduit = [];
  List<String> docIDsLivreur = [];
  List<String> docIDsCompte = [];
  List<String> docIDsCommande = [];
  List<String> docIDs = [];
  var taille = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('client')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDs.add(document.reference.id);
            }));
   
    setState(() { });
  }

  Future getDocIdCommerce() async {
    await FirebaseFirestore.instance
        .collection('commerce')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsCommerce.add(document.reference.id);
            }));
   setState(() { });
  }

  Future getDocIdCategorie() async {
    await FirebaseFirestore.instance
        .collection('categorie')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsCategorie.add(document.reference.id);
            }));
    setState(() { });
  }

  Future getDocIdProduit() async {
    await FirebaseFirestore.instance
        .collection('produit')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsProduit.add(document.reference.id);
    }));
    setState(() { });
  }

  Future getDocIdLivreur() async {
    await FirebaseFirestore.instance
        .collection('livreur')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsLivreur.add(document.reference.id);
      }));
      setState(() { });
  }

  Future getDocIdCompte() async {
    await FirebaseFirestore.instance
        .collection('compte')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsCompte.add(document.reference.id);
    }));
    setState(() { });
  }

  Future getDocIdCommande() async {
    await FirebaseFirestore.instance
        .collection('commander')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsCompte.add(document.reference.id);
    }));
    setState(() { });
  }

  var to;
  @override
  void initState() {
    getDocId();
    getDocIdCategorie();
    getDocIdCommerce();
    getDocIdCompte();
    getDocIdLivreur();
    getDocIdProduit();
    getDocIdCommande();

    super.initState();
    //sendTaille();
    // startAutoReload();
  }

  @override
  Widget build(BuildContext context) {
    
      setState(() {});

    return SafeArea(
        child: Scaffold(
            body: Center(
      child: new Center(
        child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/img/panier2.jpg"),
            //         fit: BoxFit.cover)),
            child: _contentPage()),
      ),
    )));
  }

  List data = [
    "client",
    "Commerce",
    "Catégories",
    "Produit",
    "Livreur",
    "Commandes",
    "Compte"
  ];
  Widget _contentPage() {
    taille = [
      docIDs.length,
      docIDsCommerce.length,
      docIDsCategorie.length,
      docIDsProduit.length,
      docIDsLivreur.length,
      docIDsCommande.length,
      docIDsCompte.length,
    ];
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Administrateur",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white60,
                  image: DecorationImage(
                      image: AssetImage("assets/img/panier2.jpg"),
                      fit: BoxFit.cover))),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.5,
                ),
                itemCount: taille.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          //Get.to(CreateClient());
                          Get.to(ReadClient());
                        } else if (index == 1) {
                          Get.to(CreateEntreprise());
                        } else if (index == 2) {
                          Get.to(CreateCategorie());
                        } else if (index == 3) {
                          Get.to(CreateProduit());
                        } else if (index == 1) {
                          Get.to(CreateEntreprise());
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            // crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[index],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                              Text(taille[index].toString()),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(255, 242, 240, 240))),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  //Lire les produits

  Widget _() {
    return FutureBuilder<DocumentSnapshot>(builder: ((context, snapshot) {
      return Text("Aucun utilisateur enrégistré..");
    }));
  }
}
