import 'package:wesave/ressource/export.dart';
import 'package:wesave/widgets/loader/PourHourGring.dart';

class Dashboard extends StatefulWidget {
  final String adminID;
  Dashboard({required this.adminID});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  final CollectionReference _collectionReferenceClient = FirebaseFirestore.instance.collection('client');
  final CollectionReference _collectionReferenceAdmin = FirebaseFirestore.instance.collection('admin');
  final CollectionReference _collectionReferenceCategorie = FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionReferenceProduit = FirebaseFirestore.instance.collection('produit');
  final CollectionReference _collectionReferenceLivreur = FirebaseFirestore.instance.collection('livreur');
  final CollectionReference _collectionReferenceCommande = FirebaseFirestore.instance.collection('commander');
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
                  );
                }),
          ),
        ],
      ),
    );
  }

  //Lire les produits
   Widget _produit() {
    return SingleChildScrollView(
     child: StreamBuilder<QuerySnapshot>(
        stream: _collectionReferenceProduit.snapshots(),
        builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
                return Center(
                  child: PouringHour(),
           );
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Text("All Categories",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox( height: 8,),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 210,
                        width: double.infinity,
                        child: Image.network(
                          snapshot.data!.docs[index].get('url_img').toString(),
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            snapshot.data!.docs[index].get('nom').toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                          "Faites vos achats le plus vite possible, pour votre cuisine sans crainte.Achetez ces épices selon la quantité"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: [
                          new Text("Poids: ",style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontSize: 20,fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: defaultPadding),
                          Text(snapshot.data!.docs[index].get('poids').toString() +" kg",
                            style: TextStyle(color: Couleur.color,fontFamily: 'Montserrat',fontSize: 20,fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0, color: Colors.black54),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 158, 158, 158),
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            );
          }),
                      ],
                    ),
                  ),
                );
              }
            }));
  }

  Widget _() {
    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
     
      return Text("Aucun utilisateur enrégistré..");
    }));
  }
  
}
