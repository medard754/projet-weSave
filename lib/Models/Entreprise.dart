import 'package:wesave/ressource/export.dart';
class Entreprise {
  final String nom;
  final String siege;
  final String adresse;
  final String email;
  final String password;

  Entreprise({
    required this.nom,
    required this.siege,
    required this.adresse,
    required this.email,
    required this.password
  });
  
   Map<String, dynamic> toJson() => {
       // 'uid': uid,
        'nom': nom,
        'siege':siege,
        'adresse': adresse,
        'email': email,
        'password': password
      };

  Future createEntreprise({required Entreprise entreprise}) async {
    final docEntreprise = FirebaseFirestore.instance.collection('entreprise').doc();
    // user.uid = docUser.id;
    final json = entreprise.toJson();
    await docEntreprise.set(json);
  }

  static Entreprise fromJson(Map<String, dynamic> json) => Entreprise(
        // uid: json['uid'],
       nom: json['nom'],
       siege: json['siege'],
       adresse: json['adresse'],
       email: json['email'],
       password: json['password'],
  );
}
