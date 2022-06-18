import 'package:wesave/ressource/export.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({
      this.uid=''
  }); 
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");
  final CollectionReference contactCollection =
      FirebaseFirestore.instance.collection("contact");
  // ignore: non_constant_identifier_names
  Future UpdateUserData(
      String nom, String email, String subject, String message) async {
    return await brewCollection
        .doc(uid)
        .set({"nom": nom, "email": email, "subject": subject, "message": message});
  }

  // ignore: non_constant_identifier_names
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
