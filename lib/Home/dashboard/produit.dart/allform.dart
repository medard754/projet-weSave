import 'package:wesave/ressource/export.dart';

import '../../../widgets/loader/PourHourGring.dart';
class ReeadProduit extends StatefulWidget {
  ReeadProduit({Key? key}) : super(key: key);

  @override
  State<ReeadProduit> createState() => _ReeadProduitState();
}

class _ReeadProduitState extends State<ReeadProduit> {
  
  final CollectionReference _collectionReferenceCategorie = FirebaseFirestore.instance.collection('categorie');
  final CollectionReference _collectionReferenceProduit = FirebaseFirestore.instance.collection('produit');
  final CollectionReference _collectionReferenceLivreur = FirebaseFirestore.instance.collection('livreur');
  final CollectionReference _collectionReferenceCommande = FirebaseFirestore.instance.collection('commander');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     child: StreamBuilder<QuerySnapshot>(
        stream: _collectionReferenceProduit.snapshots(),
        builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
                return Center(
                  child: PouringHour(),
           );
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Text("All Produits",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox( height: 8,),
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: 200,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width/3,
                    child: Image.network(snapshot.data!.docs[index].get('url_img').toString(),fit: BoxFit.contain,)),
                    const SizedBox(height: defaultPadding),
                    Container(height:MediaQuery.of(context).size.height*0.4,width:MediaQuery.of(context).size.width/3,
                      child:Column(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.docs[index].get('nom').toString(),style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontSize: 22,fontWeight: FontWeight.w700,),),
                          const SizedBox(height: defaultPadding+5),
                          Text(snapshot.data!.docs[index].get('pu').toString(),style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontSize: 22,fontWeight: FontWeight.w700,),),
                        ],
                      ),
                    ),
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
                  ),
                );
              }
            }));
  }

  
}