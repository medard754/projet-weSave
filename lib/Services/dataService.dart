import 'package:wesave/ressource/export.dart';

class FirebaseServices {
  //Firestore _fireStoreDataBase = Firestore.instance;
  CollectionReference _collectionReferenceCat =
      FirebaseFirestore.instance.collection('categorie');
  // ignore: prefer_final_fields
  CollectionReference _collectionReferenceEpice =
      FirebaseFirestore.instance.collection('produit');
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
}
