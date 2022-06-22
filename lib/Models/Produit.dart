import 'package:wesave/ressource/export.dart';
class Produit {
  final String? reference;
  final int? pu;
  final String? codeCat;
  final String? url_img;
  //final DateTime date;

  Produit({
     this.reference,
     this.pu,
     this.codeCat,
     this.url_img,
    // required this.date,
  });

   Map<String, dynamic> toJson() => {
       // 'uid': uid,
        'reference': reference,
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
      reference: json['reference'],
      pu: json['pu'],
      codeCat:json['codeCat'],
      url_img: json['url_img']
    );
  
}
