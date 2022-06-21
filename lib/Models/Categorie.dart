class Categorie {
  final String codeCat;
  final String nom;
  

  Categorie({
    required this.codeCat,
    required this.nom,
    
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      codeCat: json['codeCat'],
      nom: json['nom'],
    );
    
   
  }
}