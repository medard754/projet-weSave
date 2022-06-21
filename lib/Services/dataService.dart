import 'package:wesave/ressource/export.dart';

class FirebaseServices {
  //Firestore _fireStoreDataBase = Firestore.instance;
  CollectionReference _collectionReferenceCat =
      FirebaseFirestore.instance.collection('categorie');
  // ignore: prefer_final_fields
  CollectionReference _collectionReferenceEpice =
      FirebaseFirestore.instance.collection('produit');

  CollectionReference _collectionReferenceUser =
      FirebaseFirestore.instance.collection('client');
  //recieve the data

  Stream<List<Produit>> getProduitList() {
    return _collectionReferenceEpice.snapshots().map((snapShot) => snapShot.docs
        .map((document) =>
            Produit.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }

  //fonction
  printer() async {
    print(await getProduitList());
  }

  //L'utilisateur
 
  //creer un client
  
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
}
