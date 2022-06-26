import 'package:wesave/Home/dashboard/dashboard.dart';
import 'package:wesave/Home/dashboard/produit.dart/commande.dart';
import 'package:wesave/ressource/export.dart';

class Wrapper extends StatefulWidget {
  String? idUser;
  int? value;
  Wrapper({this.idUser, this.value});
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<AppUser?>(context);
    final user =
        FirebaseFirestore.instance.collection('users').doc(widget.idUser);
  
      if (widget.value == 0) {
        return Dashboard(adminID: widget.idUser);
      } else if (widget.value == 1) {
        return Container();
      } else if (widget.value == 2) {
        Get.to(Commander());
        //return Container();
      }
      return Container(child: Center(child:Text("nullll")),);
    }
  
}
