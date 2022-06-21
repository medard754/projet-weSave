import 'package:flutter/material.dart';
import 'package:wesave/ressource/export.dart';

class searchList extends SearchDelegate {
  List<String> data = [
    "Afghanistan",
    "Algérie",
    "Angola",
    "Antilles Néerlandaises",
    "Arménie",
    "Autriche",
    "Bahrein",
    "Belgique",
    "Bermudes",
    "Bostwana",
    "Bulgarie",
    "Bénin",
    "Cambodge",
    "Cap-vert",
    "Chypre",
    "Corée du nord",
    "Côte d'Ivoire",
    "Danemark",
    "Egypte",
    "Erythrée",
    "Etats Fédérés de Micronésie",
    "Fidji",
    "Géorgie du sud et les Îles Sandwich du Sud",
    "Grèce",
    "Guadeloupe",
    "Guinée",
    "Guyana",
    "Honduras ",
    "Îles Christmas",
    "Îles Aland",
    "Îles Coock",
    "Îles Mariannes du nord",
    "Îles Salomon",
    "Îles Vierges des Etats-Unis",
    "Iran",
    "Islande",
    "Jamîque",
    "Kazakhstan",
    "Kiribati",
    "Le Vatican",
    "Liban",
    "Liechtenstein",
    "Macao",
    "Malawi",
    "Malte",
    "Mali",
    "Maurice",
    "Mexique",
    "Mongolie",
    "Mozambique",
    "Népal",
    "Nigéria",
    "Nouvelle-Calédonie",
    "Ouganda",
    "Palaos",
    "Paraguay",
    "Philippines",
    "Porto Rico",
    "République Centrafricaine",
    "République Dominicaine",
    "Réunion",
    "Russie",
    "Saint-Marin",
    "Sainte-Hélène",
    "Samoa",
    "Sénégal",
    "Sierra Leone",
    "Slovénie",
    "Sri Lanka",
    "Suriname",
    "Syrie",
    "Tanzanie",
    "Thaîlande",
    "Tonga",
    "Turkménistan",
    "Ukraine",
    "Venezuela",
    "Yémen"
  ];
  List<String> searchItem = ['Apple', 'Banana', 'Pear','Oranges'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   
    List<String> newsQuery = [];
    for (var pays in data) {
      if (pays.toLowerCase().contains(query.toLowerCase())) {
        newsQuery.add(pays);
       
      } else if (query == "") {
        return Text("");
      } 
    }
  
    return ListView.builder(
        itemCount: newsQuery.length,
        itemBuilder: (context, index) {
          var answer = newsQuery[index];
          return ListTile(
              title: Text(answer),
              trailing: IconButton(
                onPressed: () {
                  
                },
                icon: Icon(Icons.favorite, color: Colors.purple),
              ));
        });

    /* if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {},
      );
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(
        title: Text("Aucune élément ne correpond à votre recherche"),
      );
    }*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: ListTile(
            title: Text(
              data[index],
              style: TextStyle(color: Colors.purple),
            ),
            trailing: IconButton(
                onPressed: () {
                  
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.purple,
                )),
            onTap: () {
              
            },
          ));
        });
  }
}