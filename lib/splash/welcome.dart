import 'package:wesave/ressource/export.dart';
class welcomePage extends StatefulWidget {
  welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  defaultPadding,
                  defaultPadding,
                  MediaQuery.of(context).padding.bottom + defaultPadding),
              children: [_onepage()],
            ),
          ),
        )
      )
    );
  }
  Widget _onepage(){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
                  height:MediaQuery.of(context).size.height/2,
                  width:MediaQuery.of(context).size.width*0.8,
                  decoration:BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/img/panier.jpg"),
                      fit: BoxFit.contain
                    )
                  ),
        ),
        
        Text(
          "Bienvenue sur WeSave",
          style:TextStyle(
            fontSize:20,
            fontWeight: FontWeight.w800,
            fontFamily: 'Montserrat'
          ),
        ),
        const SizedBox(height:10),
        Text(
          "La plateforme qui vous offre la possibilité de fait des achats en ligne dans divers supermarché à moins prix.",
          style:TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat'
          ),
          textAlign:TextAlign.center
        ),
        const SizedBox(height:2),
        Text(
          "Désormais vous aurez depuis cette plateforme les détails et vue des produits tombant en date courte",
          style:TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat'
          ),
          textAlign:TextAlign.center
        ),
        const SizedBox(height:20),
        Flatbotton(routeName: '/homepage', text: 'Continuez votre navigation', icon: Icons.shopping_cart,)
      ],
    );
  }

   
}