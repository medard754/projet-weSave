class Produit {
  final String nom;
  final int poids;
  final String codeCat;
  final String url_img;
  Produit({
    required this.nom,
    required this.poids,
    required this.codeCat,
    required this.url_img,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      nom: json['nom'] ,
      poids: json['poids'],
      codeCat:json['codeCat'], 
      url_img:json['url_img']
    );
  }
}
