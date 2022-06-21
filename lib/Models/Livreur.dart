import 'package:wesave/ressource/export.dart';
class Livreur {
  final String nom;
  final String prenom;
  final String telephone;
  final String adresse;
  Livreur({
    required this.nom,
    required this.prenom,
    required this.telephone,
    required this.adresse
  });


  Map<String, dynamic> toJson() => {
       // 'uid': uid,
    'nom': nom,
    'prenom': prenom,
    'telephone': telephone,
    'adresse': adresse,
  };

  Future createLivreur({required Livreur livreur}) async {
    final docLivreur = FirebaseFirestore.instance.collection('categorie').doc();
    // user.uid = docUser.id;
    final json = livreur.toJson();
    await docLivreur.set(json);
  }

  static Livreur fromJson(Map<String, dynamic> json) => Livreur(
        // uid: json['uid'],
      nom: json['nom'],
      prenom: json['prenom'],
      telephone: json['telephone'],
      adresse: json['adresse'],
  );
  
}
