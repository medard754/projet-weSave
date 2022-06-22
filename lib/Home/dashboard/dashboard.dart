import 'package:wesave/Home/dashboard/client/allform.dart';
import 'package:wesave/Home/dashboard/client/createform.dart';
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
      FirebaseFirestore.instance.collection('livreur');
  final CollectionReference _collectionReferenceCommande =
      FirebaseFirestore.instance.collection('commander');
  @override
  Widget build(BuildContext context) {
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
    "Entreprise",
    "Catégories",
    "Produit",
    "Livreur",
    "Commandes"
  ];
  Widget _contentPage() {
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(CreateClient());
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
                              Text("12")
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
