class Livreur {
  final String nom;
  final String prenom;
  final int telephone;
  final String adresse;
  Livreur({
    required this.nom,
    required this.prenom,
    required this.telephone,
    required this.adresse
  });

  factory Livreur.fromJson(Map<String, dynamic> json) {
    return Livreur(
      nom: json['nom'],
      prenom: json['prenom'],
      telephone: json['telephone'],
      adresse: json['adresse'],
    );
  }
}
