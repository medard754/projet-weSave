import 'package:wesave/ressource/export.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({
      this.uid=''
  }); 
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brew");
  final CollectionReference contactCollection = FirebaseFirestore.instance.collection("contact");
  CollectionReference _collectionReferenceUser =
      FirebaseFirestore.instance.collection('client');

  // Créer un client
  Future createUser({required AppUser user}) async {
    final docUser = FirebaseFirestore.instance.collection('client').doc();
   // user.uid = docUser.id;
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


  Future UpdateUserData(
      String nom, String email, String subject, String message) async {
    return await brewCollection
        .doc(uid)
        .set({"nom": nom, "email": email, "subject": subject, "message": message});
  }

  // ignore: non_constant_identifier_names


  Future UserDetails({
    required String nom,
    required String prenoms,
    required int telephone,
    required String email,
    required String password,
    }
    ) async {
    await FirebaseFirestore.instance.collection('client').add(
      {
        'nom':nom,
        'prenoms': prenoms,
        'telephone':telephone,
        'email': email,
        'password': password
      }
    );
  }




  Future ContactForm(String nom, String email, String subject, String message) async {
    return await contactCollection.add({
      "nom": nom, 
      "email": email, 
      "subject": subject, 
      "message": message
    });
        
  }
  //recupere les données
  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
  }
  
}
