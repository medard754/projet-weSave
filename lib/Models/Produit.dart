import 'package:wesave/ressource/export.dart';
class Produit {
  final String nom;
  final int qte;
  final int pu;
  final String codeCat;
  final String url_img;
  //final DateTime date;

  Produit({
    required this.nom,
    required this.qte,
    required this.pu,
    required this.codeCat,
    required this.url_img,
    // required this.date,
  });

   Map<String, dynamic> toJson() => {
       // 'uid': uid,
        'nom': nom,
        'qte': qte,
        'pu': pu,
        'codeCat': codeCat,
        'url_img': url_img
      };

  Future createProduit({required Produit produit}) async {
    final docProduit = FirebaseFirestore.instance.collection('produit').doc();
    // user.uid = docUser.id;
    final json = produit.toJson();
    await docProduit.set(json);
  }

  static Produit fromJson(Map<String, dynamic> json) => Produit(
        // uid: json['uid'],
      nom: json['nom'],
      qte: json['qte'],
      pu: json['pu'],
      codeCat:json['codeCat'],
      url_img: json['url_img']
    );
  
}
