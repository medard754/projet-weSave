class Produit {
  final String nom;
  final int qte;
  final int pu;
  final String codeCat;
  final String url_img;
  //final DateTime date;

  Produit({
    required this.nom,
    required this.qte,
    required this.pu,
    required this.codeCat,
    required this.url_img,
    // required this.date,
  });

  
  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      nom: json['nom'],
      qte: json['qte'],
      pu: json['pu'],
      codeCat: json['codeCat'],
      url_img: json['url_img'],
      // date: json['date']
    );
  }
}
