import 'package:wesave/ressource/export.dart';

class Entreprise {
  String? uid;
  final String? nom;
  final String? adresse;
  final String? telephone;
  final String? email;
  final String? siege;
  final int? ifu;
  final int? value;

  Entreprise(
      {this.uid,
      this.nom,
      this.adresse,
      this.telephone,
      this.email,
      this.siege,
      this.ifu,
      this.value});

  Map<String, dynamic> toJson() => {
       'uid': uid,
        'nom': nom,
        'adresse': adresse,
        'telephone': telephone,
        'email': email,
        'siege': siege,
        'ifu': ifu,
        'value': value
      };

  Future createEntreprise({required Entreprise entreprise}) async {
    final docEntreprise = FirebaseFirestore.instance.collection('users').doc();
    final docEntre = FirebaseFirestore.instance.collection('commerce').doc();
     entreprise.uid = docEntreprise.id;
    final json = entreprise.toJson();
    await docEntreprise.set(json);
    await docEntre.set(json);
  }

  static Entreprise fromJson(Map<String, dynamic> json) => Entreprise(
         uid: json['uid'],
        nom: json['nom'],
        adresse: json['adresse'],
        telephone: json['telephone'],
        email: json['email'],
        siege: json['siege'],
        ifu: json['ifu'],
        value: json['value'],
      );
}
