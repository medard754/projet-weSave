import 'package:cloud_firestore/cloud_firestore.dart';
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
//final UserController userController = Get.put(UserController());
  // Créer un client
  Future createUser({required AppUser user}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    // final docAdmin = FirebaseFirestore.instance.collection('admin').doc();
    user.uid = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
    //await docAdmin.set(json);
  }

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      telephone: json['telephone'],
      email: json['email'],
      password: json['password'],
      value: json['value']);

//Lire un utilisateur
  Future getUserDoc() async {
    AppUser us = AppUser();
    //List<AppUser> users = [];
    List users = [];
    final userRef = FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    //delete
    final useref =
        FirebaseFirestore.instance.collection("users").doc('4521').delete();
    //update
    //delete
    final usereU =
        FirebaseFirestore.instance.collection("users").doc('4521').delete();
    //delete sous collection
    final use = FirebaseFirestore.instance
        .collection("users")
        .doc('4521')
        .collection("collectionPath")
        .doc('4521')
        .delete();

    await userRef.get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          users.add(element.data());

          // users = element.data();
          print(us.email);
        });
      }
    });
    // print('variable user $us');
    return users;
  }

//Enrégistré un produit
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

  Future<void> createpersonne( {required AppUser user}) async {
    final DocumentReference _noteRef =
        FirebaseFirestore.instance.collection("users").doc();
    user.uid = _noteRef.id;
    Map<String, dynamic> data = <String, dynamic>{
      "uid": user.uid,
      "nom": user.nom,
      "prenoms": user.prenoms,
      "telephone": user.telephone,
      "email": user.email,
      "adresse": user.adresse,
    };
    
  }

//Lire les utilisateurs
  Stream<List<dynamic>> getUserList() {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
        (snapShot) => snapShot.docs
            .map((document) =>
                AppUser.fromJson(document.data as Map<String, dynamic>))
            .toList());
  }

  /*Modifier un client*/
  //à completer
  /*Supprimer un client*/
  Future<AppUser> getUser(String uid) async {
    AppUser us = AppUser();
    final userRef = FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    await userRef.where('uid', isEqualTo: uid).get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          if (element.exists) {
            us = element.data();
          }
        });
      }
    });
    // print('variable user $us');
    return us;
  }

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

   Future UserDetails({
    required AppUser user
    }
    ) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'uid': FirebaseFirestore.instance.collection('users').doc().id,
        'nom':user.nom,
        'prenoms': user.prenoms,
        'telephone':user.telephone,
        'email': user.email,
        'adresse': user.adresse
      }
    );
  }
}

 
 /*Future UpdateUserData(
      String nom, String email, String subject, String message) async {
    return await FirebaseFirestore.instance.collection(collectionPath)
        .doc(uid)
        .set({"nom": nom, "email": email, "subject": subject, "message": message});*/
   