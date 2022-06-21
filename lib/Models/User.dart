import 'package:wesave/ressource/export.dart';

class AppUser {
  late final String? uid;
  final String? nom;
  final String? prenoms;
  final int? telephone;
  final String? email;
  final String? password;

  AppUser(
      { this.uid,
      this.nom,
      this.prenoms,
      this.telephone,
      this.email,
      this.password});

  Map<String, dynamic> toJson() => {
       // 'uid': uid,
        'name': nom,
        'prenoms': prenoms,
        'telephone': telephone,
        'email': email,
        'password': password
      };

  Future createUser({required AppUser user}) async {
    final docUser = FirebaseFirestore.instance.collection("client").doc();
    final json = user.toJson();
    await docUser.set(json);
  }

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
      // uid: json['uid'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      telephone: json['telephone'],
      email: json['email'],
      password: json['password']);
}
