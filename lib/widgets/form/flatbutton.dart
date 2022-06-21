import 'package:wesave/Home/home.dart';
import 'package:wesave/ressource/export.dart';

class Flatbotton extends StatefulWidget {
  final String text;
  final String routeName;
  final IconData icon;
  Flatbotton({required this.text, required this.routeName, required this.icon});

  @override
  State<Flatbotton> createState() => _FlatbottonState();
}

class _FlatbottonState extends State<Flatbotton> {
  //Color color = Couleur.color;
  HexColor color = HexColor("#6D9C3E");
  @override
  Widget build(BuildContext context) {
    return FlatButton(
       minWidth: double.infinity,
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        color: color,
        onPressed: () async {
          /*if (_formKey.currentState!.validate()) {
              print("continious sign up");
          }*/
          Get.offAll(HomePage());
        },
        child: Container(
          width:MediaQuery.of(context).size.width,
          height:25,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(widget.icon,size:20,),color:Colors.white,),
              
              Text(widget.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat")),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size:20,),color:Colors.white,),
            ],
          ),
        ));
  }
}
