import 'package:rxdart/rxdart.dart';
import 'package:wesave/Controller/searchlist.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/Models/Produit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 1);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List categorie = [
    "All",
    "jus",
    "Biscuits",
    "Boissons",
    "Chocolat",
    "Chips",
    "Bonbon",
    "vive-frais",
    "conserve"
  ];
  List<Produit> produit = [
    Produit(
        reference: "Biscuit",
        pu: 500,
        codeCat: "nono",
        url_img: "assets/img/b1.jpeg"),
    Produit(
        reference: "Chocolat",
        pu: 350,
        codeCat: "nono",
        url_img: "assets/img/b3.jpeg"),
    Produit(
        reference: "Petit Poids",
        pu: 1500,
        codeCat: "nono",
        url_img: "assets/img/b3.jpeg"),
    Produit(
        reference: "Sardine",
        pu: 500,
        codeCat: "nono",
        url_img: "assets/img/b4.jpeg"),
    Produit(
        reference: "Petit poids",
        pu: 650,
        codeCat: "nono",
        url_img: "assets/img/b5.jpeg"),
    Produit(
        reference: "Apolo",
        pu: 700,
        codeCat: "nono",
        url_img: "assets/img/b6.jpeg"),
    Produit(
        reference: "Biscuit",
        pu: 800,
        codeCat: "nono",
        url_img: "assets/img/b7.jpeg"),
  ];

  List<dynamic> produits = [];
  List<Produit> produi = [];
  //List<String> user = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    final produitRef = FirebaseFirestore.instance
        .collection("produit")
        .withConverter<Produit>(
          fromFirestore: (snapshot, _) => Produit.fromJson(snapshot.data()!),
          toFirestore: (produit, _) => produit.toJson(),
        );
    Stream<QuerySnapshot> comments = produitRef.snapshots();
    var results = comments.map((qShot) async {
      var futures = qShot.docs.map((doc) async {
        return Produit(
          red: (doc.data() as Produit).red,
          url_img: (doc.data() as Produit).url_img,
        );
      });

      return await Future.wait(futures);
    });
    dynamic result = produitRef.get().then((snapshot) {
      setState(() {});
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          produits.add(element.data());

          // users = element.data();
        });
      }
    });

    return SafeArea(
        child: Scaffold(
      //backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Couleur.color),
        centerTitle: true,
        title: Text("Accueil",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 17)),
        elevation: 0.5,
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Couleur.color),
              iconSize: 22,
              onPressed: () {
                showSearch(context: context, delegate: searchList());
              }),
          IconButton(
            onPressed: () {
              Get.to(ControlUser());
            },
            icon: Icon(Icons.person, color: Colors.black),
            iconSize: 23,
          ),
          /* IconButton(
                  onPressed: () => controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut),
                  icon: const Icon(Icons.keyboard_arrow_left),
                ),
                IconButton(
                  onPressed: () => controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut),
                  icon: const Icon(Icons.keyboard_arrow_right),
                )*/
        ],
      ),
      body: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.6,
                ),
                itemCount: produits.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 165,
                                child: Image.network(
                                    produits[index].url_img.toString(),
                                    //produitRef[index].
                                    fit: BoxFit.contain),
                                //height:MediaQuery.of(context).size.height*0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black12, width: 1))),
                            const SizedBox(height: defaultPadding),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 80,
                                    child: Text(
                                        produits[index].pu.toString() + "f",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  const SizedBox(height: defaultPadding),
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.redAccent,
                                    height: 30,
                                    width: 50,
                                    child: Text(
                                        produits[index].red.toString() + "%",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Expire: " +
                                        produits[index].date.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200),
                                    textAlign: TextAlign.end,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var img =
                                          produits[index].url_img.toString();
                                      var commerce =
                                          produits[index].date.toString();
                                      var reference =
                                          produits[index].reference.toString();
                                      var pu = produits[index].pu.toString();
                                      var red = produits[index].red.toString();
                                      var qte=produits[index].red.toString();
                                      print("Acheter");
                                      showDialogFuncUser(context, img, commerce,
                                          reference, pu, red,qte);
                                    },
                                    child: Text(
                                      "Consultez",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 182, 38, 38),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white)),
                  );
                }),
          )
        ],
      )),
    ));
  }

  showDialogFunc(context, var img, var nom, var qte, var categorie, var prix) {
    return showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Icon(Icons.close_outlined, color: Couleur.color),
                          iconSize: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Image.network(
                          img,
                          fit: BoxFit.contain,
                        )),
                    Column(
                      children: [
                        Text(
                          nom,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          qte,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Expire: 2022-06-30",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                            minWidth: 200,
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            color: Colors.black12,
                            onPressed: () async {
                              Get.to(Get.to(ControlUser()));
                            },
                            child: Text("Ajouter au panier",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"))),
                        FlatButton(
                            minWidth: 200,
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            color: Colors.black12,
                            onPressed: () async {
                              //Get.to(Get.to(ControlUser()));
                              //setState(() {});
                            },
                            child: Text("Commander",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showDialogFuncUser(
      context, var img, var date, var refrence, var pu, var red,var qte) {
    return showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Container(
                        //   height:30,
                        //   child:Text(commerce,style:TextStyle(fontSize:20,fontWeight:FontWeight.w700 ), )
                        // ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.network(
                              img,
                              fit: BoxFit.contain,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(refrence,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat')),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(pu.toString()+"f",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat')),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(red.toString() + "%",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat')),
                            Text("Expire le " + date,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'),
                                    
                          ),
                          
                        const SizedBox(
                              height: 8,
                            ),
                           Text(qte + " kg",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'))
                          ],
                        ),

                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                                minWidth: 150,
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                color: Colors.black,
                                onPressed: () async {},
                                child: Text("Ajouter au panier",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat"))),
                            FlatButton(
                                minWidth: 150,
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                color: Colors.black12,
                                onPressed: () async {
                                  Get.to(ControlUser());
                                  setState(() {});
                                },
                                child: Text("Commander",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat"))),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
