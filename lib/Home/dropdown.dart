import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:wesave/ressource/export.dart';
class Dropdown extends StatefulWidget {
  Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> docIDsCommerce = [];
  List<String> docIDsCategorie = [];
  List<String> docIDsProduit = [];
  List<String> docIDsLivreur = [];
  List<String> docIDsCompte = [];
  List<String> docIDsCommande = [];
  List<String> docIDs = [];
  Future getDocIdProduit() async {
    await FirebaseFirestore.instance
        .collection('produit')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDsProduit.add(document.reference.id);
    }));
    setState(() { });
  }
  List<String> commerceData = [];
  List<String> commerceId = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }
 final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;

@override
Widget build(BuildContext context) {
   setState(() {});
    final userRef = FirebaseFirestore.instance
        .collection("commerce")
        .withConverter<Entreprise>(
          fromFirestore: (snapshot, _) => Entreprise.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    dynamic result = userRef.get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          commerceData.add(element.data().nom.toString());
          commerceId.add(element.reference.id.toString());
          // users = element.data();
        });
        setState(() {});
      }
    });
  return Scaffold(
    body: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Selectioner un commerce ',
            style: TextStyle(
              fontSize: 14,
              color: Theme
                      .of(context)
                      .hintColor,
            ),
          ),
          items: commerceData
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
        ),
      ),
    ),
  );
}

}