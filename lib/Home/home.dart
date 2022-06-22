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
  @override
  Widget build(BuildContext context) {
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
                showSearch(
                    context: context,
                    delegate: searchList());
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
      body: _contentHomePage(),
      /*floatingActionButton: FloatingActionButton(
          backgroundColor: Couleur.color,
          child: Icon(Icons.search),
          onPressed: () {
            //showSearch(context: context, delegate: searchList());
          }),*/
    ));
  }

  Widget _contentHomePage() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Expanded(
                child: Container(
              color: Color.fromARGB(232, 255, 255, 255),
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorie.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        child: Text(categorie[index],
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600)),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(31, 228, 224, 224)),
                      ),
                    );
                  }),
            )),
          ),
          const SizedBox(height: defaultPadding - 8),
          _Prototype()
        ],
      ),
    );
  }

  Widget _Prototype() {
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.9,
          ),
          itemCount: produit.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          //height:MediaQuery.of(context).size.height*0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      produit[index].url_img.toString()),
                                  fit: BoxFit.contain))),
                      const SizedBox(height: defaultPadding),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              child: Text(produit[index].pu.toString() + "f",
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
                              child: Text("-38%",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white)),
            );
          }),
    );
  }

  /*showDialogFunc(
    context, var img, var nom, var poids, var categorie, var prix) {
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
                          icon: Icon(Icons.close_outlined, color: color),
                          iconSize: 20,
                        )
                      ],
                    ),
                    Text(
                      nom,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: 220,
                        width: double.infinity,
                        child: Image.network(
                          img,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                         Get.to(ControlUser());
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 15,
                        ),
                        label: Text(
                          "Continuer pour validé l'achat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }*/
}
