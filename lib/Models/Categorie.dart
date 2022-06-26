import 'package:wesave/ressource/export.dart';

class Categorie {
  String? uid;
  final String? libelle;
  final String? description;

  Categorie({
    this.uid,
    this.libelle,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'libelle': libelle,
        'description': description,
      };

  Future createCategorie({required Categorie categorie}) async {
    final docCategorie =
        FirebaseFirestore.instance.collection('categorie').doc();

   categorie.uid = docCategorie.id;
    final json = categorie.toJson();
    await docCategorie.set(json);
  }

  static Categorie fromJson(Map<String, dynamic> json) => Categorie(
        uid: json['uid'],
        libelle: json['libelle'],
        description: json['description'],
      );
}
