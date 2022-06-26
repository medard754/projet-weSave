import 'package:wesave/ressource/export.dart';

class Produit {
  String? uid;
  final String? reference;
  final int? pu;
  final String? codeCat;
  final String? url_img;
  final String? date;
  final int? red;
  final String? commerce;
  final int? qte;
  //final DateTime date;

  Produit(
      {this.uid,
      this.reference,
      this.pu,
      this.codeCat,
      this.url_img,
      this.date,
      this.red,
      this.commerce,this.qte
      // required this.date,
      });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'reference': reference,
        'pu': pu,
        'codeCat': codeCat,
        'url_img': url_img,
        'date': date,
        'red': red,
        'commerce': commerce,
        'qte': qte
      };

  Future createProduit({required Produit produit}) async {
    final docProduit = FirebaseFirestore.instance.collection('produit').doc();
    produit.uid = docProduit.id;
    final json = produit.toJson();
    await docProduit.set(json);
  }

  static Produit fromJson(Map<String, dynamic> json) => Produit(
        uid: json['uid'],
        reference: json['reference'],
        pu: json['pu'],
        codeCat: json['codeCat'],
        url_img: json['url_img'],
        date: json['date'],
        red: json['red'],
        commerce: json['commerce'],
        qte: json['qte'],
      );
}
