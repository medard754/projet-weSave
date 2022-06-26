import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:wesave/ressource/export.dart';
import 'package:file_picker/file_picker.dart';

class CreateProduit extends StatefulWidget {
  CreateProduit({Key? key}) : super(key: key);

  @override
  State<CreateProduit> createState() => _CreateProduitState();
}

class _CreateProduitState extends State<CreateProduit> {
  final AuthService _authService = AuthService();
  final FirebaseServices _firebaseServices = FirebaseServices();
  final DatabaseService _databaseService = DatabaseService();
  File? photosource;
  final Produit _produit = Produit();
  bool loading = false;
  String error = '';
  String errorpwd = '';
  final _formKey = GlobalKey<FormState>();
  //User model = User();
  late String onBoardingLevel;
  bool isLoading = false;
  bool isValue = false;

  String reference = "";
  int pu = 0;
  String libelle = "";
  String url_img = "";
  UploadTask? task;
  File? file;
  bool doesAnFileSlected = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/img/panier2.jpg"),
                //         fit: BoxFit.cover)),
                children: [
                _formbody(context),
                //   ListView(
                //   physics: BouncingScrollPhysics(),
                //   padding: EdgeInsets.fromLTRB(
                //       defaultPadding,
                //       defaultPadding,
                //       defaultPadding,
                //       MediaQuery.of(context).padding.bottom + defaultPadding),
                //   children: [],
                // ),
              ]));
  }

  Widget _formbody(context) {
    final imageName =
        (file != null) ? basename(file!.path) : "Aucun fichier sélectionner";
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enrégistré un produit",
                style: TextStyle(
                    color: Couleur.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Montserrat"),
                textAlign: TextAlign.center,
              ),
              /* ButtonWidget(
                    icon: Icons.attach_file,
                    text: "Sélectionner une image",
                    onTap: selectImage),
                SizedBox(height: 28.0),
                Text("${imageName}"),
                SizedBox(height: 28.0),
                ButtonWidget(
                    icon: Icons.upload_file_outlined,
                    text: "Envoyer le fichier",
                    onTap: uploadFile),
                SizedBox(height: 10.0),
                task != null ? buildUploadstatus(task!) : Container(),*/
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /*CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: file != null
                          ? AssetImage(file!.path)
                          : AssetImage("assets/img/panier2.jpg"),
                    ),*/
                    GestureDetector(
                        onTap: selectImage,
                        child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text("Sélectionner une image"),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 2))))
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              
              SizedBox(height: 10),
              const SizedBox(
                height: 10,
              ),
              SizedBox(height: 25),
              CustomInput(
                  title: "Reference",
                  placeholder: "Entrer la reference du produit",
                  obscure: false,
                  err: "entrer une reference valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer une reference valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      reference = e;
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Prix unitaire",
                  placeholder: "Entrer le prix unitaire",
                  obscure: false,
                  err: "entrer un prix valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer un prix valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      pu = int.parse(e);
                    });
                  },
                  icon: Icons.person,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding),
              CustomInput(
                  title: "Categorie",
                  placeholder: "Entrer la categorie du produit",
                  obscure: false,
                  err: "entrer une categorie valid",
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "entrer une categorie valid";
                    }
                  },
                  onSaved: (e) {
                    setState(() {
                      libelle = e;
                    });
                  },
                  icon: Icons.mail,
                  max: 2,
                  min: 1),
              const SizedBox(height: defaultPadding + 4),
              FlatButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  color: Couleur.color,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        //loading = true;
                      });
                      //dynamic url_img = uploadFile();

                      final produit = Produit(
                          reference: reference,
                          pu: pu,
                          codeCat: libelle,
                          url_img: url_img);
                      _produit.createProduit(produit: produit);
                    }
                  },
                  child: Text("Enrégistré le produit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"))),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }

  Future selectImage() async {
    //final photosource= awiat
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Future<dynamic> uploadFile() async {
    if (file == null) {
      setState(() {
        doesAnFileSlected = true;
      });
      return;
    }
    final imageName = basename(file!.path);
    final destination = "image/$imageName";
    task = FirebaseApi.upload(destination, file!);
    setState(() {});
    if (task == null) return;
    final snapShot = await task!.whenComplete(() {});
    String url = await snapShot.ref.getDownloadURL();

    return  url;
  }

  buildUploadstatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          final snap = snapShot.data!;
          final transmission = snap.bytesTransferred / snap.totalBytes;
          final percentTransmitted = (transmission * 100).toStringAsFixed(2);
          return Text(
            "$percentTransmitted %",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Container();
        }
      });
}

class FirebaseApi {
  static UploadTask? upload(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print("Error while uploading $e");
      return null;
    }
  }
}
/*
void _onPressed() {
    //pickImageFromGallery(ImageSource.gallery);
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async {
    if (file == null) {
      setState(() {
        doesAnFileSlected = true;
      });
      return;
    }
    final imageName = basename(file!.path);
    final destination = "image/$imageName";
    task = FirebaseApi.upload(destination, file!);
    setState(() {});
    if (task == null) return;
    ;
    final snapShot = await task!.whenComplete(() {});
    final url = await snapShot.ref.getDownloadURL();
    await _auth.createPost(imageName);
    Get.back();
  }

  buildUploadstatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          final snap = snapShot.data!;
          final transmission = snap.bytesTransferred / snap.totalBytes;
          final percentTransmitted = (transmission * 100).toStringAsFixed(2);
          return Text(
            "$percentTransmitted %",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Container();
        }
      });
}

class FirebaseApi {
  static UploadTask? upload(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print("Error while uploading $e");
      return null;
    }
  }
}*/