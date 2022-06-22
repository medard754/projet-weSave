import 'package:wesave/ressource/export.dart';
class Categorie {
  final String? libelle;
  final String? description;

  Categorie({
    this.libelle,
    this.description,
  });

  Map<String, dynamic> toJson() => {
       // 'uid': uid,
    'libelle': libelle,
    'description': description,
  };

  Future createCategorie({required Categorie categorie}) async {
    final docCategorie = FirebaseFirestore.instance.collection('categorie').doc();
    // user.uid = docUser.id;
    final json = categorie.toJson();
    await docCategorie.set(json);
  }

  static Categorie fromJson(Map<String, dynamic> json) => Categorie(
        // uid: json['uid'],
      libelle: json['libelle'],
      description: json['description'],
      );
      
       
}
