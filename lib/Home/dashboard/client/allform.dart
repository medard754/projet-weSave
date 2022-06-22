import 'package:wesave/Home/dashboard/client/createform.dart';
import 'package:wesave/ressource/export.dart';

import '../../../widgets/loader/PourHourGring.dart';

class ReadClient extends StatefulWidget {
  ReadClient({Key? key}) : super(key: key);

  @override
  State<ReadClient> createState() => _ReadClientState();
}

class _ReadClientState extends State<ReadClient> {
  final CollectionReference _collectionReferenceCategorie =
      FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionReferenceLivreur =
      FirebaseFirestore.instance.collection('livreur');
  final CollectionReference _collectionReferenceClient =
      FirebaseFirestore.instance.collection('client');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //backgroundColor: Colors.black12,
      body: _read(),
    ));
  }

  Widget _read() {
    return FutureBuilder<DocumentSnapshot>(builder: ((context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: Text("toto est là"),
        );
      } else {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text('Nom: ${data['nom']}');
      }
      
    }));
  }

  Widget _produits() {
    return StreamBuilder<QuerySnapshot>(
        stream: _collectionReferenceClient.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("COnnexion invalidr"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("All Clients",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(height: defaultPadding),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get('nom')
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding + 5),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get('prenom')
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding + 5),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get('telephone')
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get('email')
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding),
                                  ],
                                ),
                                const SizedBox(height: defaultPadding - 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Get.to(CreateClient());
                                        },
                                        child: Container(
                                          child: Text("C"),
                                          color: Colors.green,
                                        )),
                                    const SizedBox(height: defaultPadding - 10),
                                    GestureDetector(
                                        onTap: () {
                                          Get.to(ReadClient());
                                        },
                                        child: Container(
                                          child: Text("R"),
                                          color:
                                              Color.fromARGB(255, 206, 226, 32),
                                        )),
                                    const SizedBox(height: defaultPadding - 10),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          child: Text("U"),
                                          color:
                                              Color.fromARGB(255, 229, 169, 16),
                                        )),
                                    const SizedBox(height: defaultPadding - 10),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          child: Text("D"),
                                          color:
                                              Color.fromARGB(255, 210, 59, 42),
                                        )),
                                    const SizedBox(height: defaultPadding - 10),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(41, 158, 158, 158),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          }
        });
  }
}
