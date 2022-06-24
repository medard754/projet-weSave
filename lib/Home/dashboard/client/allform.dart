import 'package:wesave/Home/dashboard/client/createform.dart';
import 'package:wesave/ressource/export.dart';
import '../../../widgets/loader/PourHourGring.dart';

class ReadClient extends StatefulWidget {
  ReadClient({Key? key}) : super(key: key);

  @override
  State<ReadClient> createState() => _ReadClientState();
}

class _ReadClientState extends State<ReadClient> {
  final DatabaseService _databaseService = DatabaseService();
  final CollectionReference _collectionReferenceCategorie =
      FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionusers =
      FirebaseFirestore.instance.collection('client');
  final CollectionReference _collectionReferenceClient =
      FirebaseFirestore.instance.collection('client');
  AppUser us = AppUser();
  List<AppUser> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    final userRef = FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    dynamic result = userRef.get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          users.add(element.data());
          // users = element.data();
        });
        setState(() {});
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(users[index].nom.toString()),
                              const SizedBox(height: defaultPadding - 8),
                              Text(users[index].prenoms.toString()),
                              const SizedBox(height: defaultPadding - 8),
                              Text(users[index].telephone.toString()),
                              const SizedBox(height: defaultPadding - 8),
                              Text(users[index].adresse.toString()),
                              const SizedBox(height: defaultPadding - 8),
                              Text(users[index].email.toString()),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1,
                                  color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector( onTap: () { Get.to(CreateClient());},child: Container(alignment:Alignment.center, color:Colors.green,height: 30, width: 60,child: Text("Create",style: TextStyle(fontWeight: FontWeight.w400)))),
                    GestureDetector(child: Container(alignment:Alignment.center,color: Colors.yellowAccent,height: 30,width:60,child: Text("Update",style:TextStyle(fontWeight: FontWeight.w400)))),
                    GestureDetector(child: Container(alignment:Alignment.center,color: Colors.redAccent,height: 30,width: 60,child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w400))))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
