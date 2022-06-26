import 'package:wesave/Home/dashboard/dashboard.dart';
import 'package:wesave/ressource/export.dart';

import '../../Home/dashboard/produit.dart/commande.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              height:MediaQuery.of(context).size.height*0.3,
                              //width:MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                              image: DecorationImage(
                              image: AssetImage("assets/img/wesave.png"),
                              fit: BoxFit.cover)),),
                            Divider(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            const SizedBox(height: defaultPadding-5),
                            ListTile(
                                title: Text("Accueil"),
                                leading: Icon(Icons.home_outlined,
                                    color: Colors.black),
                                selectedColor:Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  Navigator.of(context).pop();
                                }),
                            Divider(
                              color: Couleur.color,
                            ),
                            ListTile(
                                title: Text("Magasin"),
                                leading: Icon(Icons.shopping_bag_rounded,
                                    color: Colors.black),
                                selectedColor: Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  Get.to(Commander());
                                }),
                            const SizedBox(height: defaultPadding),
                            ListTile(
                                title: Text("Catégories"),
                                leading: Icon(Icons.category_outlined,
                                    color: Colors.black),
                                selectedColor: Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  Get.to(Dashboard(adminID: '',));
                                }),
                            const SizedBox(height: defaultPadding-5),
                            ListTile(
                                title: Text("Contacter le service"),
                                leading: Icon(Icons.phone_callback_rounded,
                                    color: Colors.black),
                                selectedColor: Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  //Get.to(Contact());
                                }),
                            const SizedBox(height: defaultPadding-5),
                            ListTile(
                                title: Text("Partager l'application"),
                                leading: Icon(Icons.share, color: Colors.black),
                                selectedColor: Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  //onIndexChanged(2);
                                }),
                            const SizedBox(height: defaultPadding),
                            ListTile(
                                title: Text("Paramètre"),
                                leading:
                                    Icon(Icons.settings, color: Colors.black),
                                //selected: selectedIndex == 3,
                                selectedColor: Couleur.color,
                                selectedTileColor: Couleur.color,
                                onTap: () {
                                  Get.defaultDialog(
                                      title: Text("Processing").toString(),
                                      titleStyle: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                      content: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text("Bientot disponible?"),
                                      ),
                                      barrierDismissible: true,
                                      radius: 5,
                                      actions: [
                                        RaisedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('okay'.tr,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          color: Colors.white,
                                        ),
                                      ]);
                                  //onIndexChanged(3);
                                }),
                            Divider(),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Divider(
                                  color: Couleur.color,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "Voulez n'êtes pas connecté",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Connectez-vous",
                                    style: TextStyle(
                                        color: Couleur.color,
                                        decoration: TextDecoration.underline),
                                  ),
                                  leading: Icon(Icons.exit_to_app_outlined,
                                      color: Couleur.color),
                                  onTap: () {
                                   // Get.to(ControlUser());
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}