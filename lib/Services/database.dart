import 'package:wesave/ressource/export.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid = ''});

  final CollectionReference _collectionReferenceUser =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _collectionReferenceAdmin =
      FirebaseFirestore.instance.collection('admin');
  final CollectionReference _collectionReferenceProduit =
      FirebaseFirestore.instance.collection('produit');

  // Créer un client
  Future createUser({required AppUser user}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
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
      password: json['password'],
      value: json['value']);
//Lire un utilisateur
  Future<AppUser> getUserDoc() async {
    AppUser us = AppUser();
    final userRef = FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    /* await userRef.where('uid', isEqualTo: uid).get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          if (element.exists) {
            us = element.data();
          }
        });
      }
    });*/
    await userRef.get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          if (element.exists) {
            us = element.data();
          }
          us = element.data();
          print(us.email);
        });
      }
    });
    // print('variable user $us');
    return us;
  }

//les Images creation
  Future<void> createPost(String imageName) async {
    final DocumentReference _noteRef =
        FirebaseFirestore.instance.collection("posts").doc();
    print("POST DATA");
    Map<String, dynamic> data = <String, dynamic>{
      "uid": uid,
      "url_img": imageName,
    };
    await _noteRef
        .set(data)
        .whenComplete(() => print("Post added successfully"))
        .catchError((e) => print(e.toString()));
    print("POST DATA");
  }

//Lire les utilisateurs
  Stream<List<AppUser>> getUsertList() {
    return _collectionReferenceProduit.snapshots().map((snapShot) => snapShot
        .docs
        .map((document) =>
            AppUser.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }
  /*Modifier un client*/
  //à completer
  /*Supprimer un client*/

  //Lire les entreprises ou supermarché
  Stream<List<Entreprise>> getEntrepriseList() {
    return _collectionReferenceProduit.snapshots().map((snapShot) => snapShot
        .docs
        .map((document) =>
            Entreprise.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }

  //Lire les catégories de la bdd
  Stream<List<Categorie>> getCategoriestList() {
    return _collectionReferenceProduit.snapshots().map((snapShot) => snapShot
        .docs
        .map((document) =>
            Categorie.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }

  //Lire les produits de la bdd
  Stream<List<Produit>> getProduitList() {
    return _collectionReferenceProduit.snapshots().map((snapShot) => snapShot
        .docs
        .map((document) =>
            Produit.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }

  //Lire les livreurs
  Stream<List<Livreur>> getLivreurList() {
    return _collectionReferenceProduit.snapshots().map((snapShot) => snapShot
        .docs
        .map((document) =>
            Livreur.fromJson(document.data as Map<String, dynamic>))
        .toList());
  }
}

 
 /*Future UpdateUserData(
      String nom, String email, String subject, String message) async {
    return await brewCollection
        .doc(uid)
        .set({"nom": nom, "email": email, "subject": subject, "message": message});
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
  }*/