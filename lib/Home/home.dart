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
        nom: "Biscuit",
        qte: 2,
        pu: 500,
        codeCat: "nono",
        url_img: "assets/img/b1.jpeg"),
    Produit(
        nom: "Chocolat",
        qte: 2,
        pu: 350,
        codeCat: "nono",
        url_img: "assets/img/b3.jpeg"),
    Produit(
        nom: "Petit Poids",
        qte: 2,
        pu: 1500,
        codeCat: "nono",
        url_img: "assets/img/b3.jpeg"),
    Produit(
        nom: "Sardine",
        qte: 2,
        pu: 500,
        codeCat: "nono",
        url_img: "assets/img/b4.jpeg"),
    Produit(
        nom: "Petit poids",
        qte: 2,
        pu: 650,
        codeCat: "nono",
        url_img: "assets/img/b5.jpeg"),
    Produit(
        nom: "Apolo",
        qte: 2,
        pu: 700,
        codeCat: "nono",
        url_img: "assets/img/b6.jpeg"),
    Produit(
        nom: "Biscuit",
        qte: 2,
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
}
