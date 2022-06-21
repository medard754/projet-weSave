import 'package:wesave/ressource/export.dart';
class Categorie {
  final String codeCat;
  final String nom;

  Categorie({
    required this.codeCat,
    required this.nom,
  });

  Map<String, dynamic> toJson() => {
       // 'uid': uid,
    'codeCat': codeCat,
    'nom': nom,
  };

  Future createCategorie({required Categorie categorie}) async {
    final docCategorie = FirebaseFirestore.instance.collection('categorie').doc();
    // user.uid = docUser.id;
    final json = categorie.toJson();
    await docCategorie.set(json);
  }

  static Categorie fromJson(Map<String, dynamic> json) => Categorie(
        // uid: json['uid'],
        codeCat: json['codeCat'],
        nom: json['nom'],
      );
      
       
}
