import 'package:wesave/ressource/export.dart';

class AppUser {
  late final String? uid;
  final String? nom;
  final String? prenoms;
  final String? telephone;
  final String? adresse;
  final String? email;
  final String? password;
  final int? value;
  AppUser(
      {this.uid,
      this.nom,
      this.prenoms,
      this.adresse,
      this.telephone,
      this.email,
      this.password,
      this.value});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': nom,
        'prenoms': prenoms,
        'telephone': telephone,
        'adresse': adresse,
        'email': email,
        'password': password,
        'value': value
      };

  Future createUser({required AppUser user}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    //final docClient = FirebaseFirestore.instance.collection("admin").doc();
    user.uid = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
    //await docClient.set(json);
  }

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
         uid: json['uid'],
        nom: json['nom'],
        prenoms: json['prenoms'],
        telephone: json['telephone'],
        adresse: json['adresse'],
        email: json['email'],
        password: json['password'],
        value: json['value'],
      );
}
