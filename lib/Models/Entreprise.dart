class Entreprise {
  final String nom;
  final String siege;
  final String adresse;
  final int telephone;
  final String email;
  final String password;

  Entreprise({
    required this.nom,
    required this.siege,
    required this.adresse,
    required this.telephone,
    required this.email,
    required this.password
  });
  factory Entreprise.fromJson(Map<String, dynamic> json) {
    return Entreprise(
        nom: json['nom'],
        siege: json['siege'],
        adresse: json['adresse'],
        telephone: json['telephone'],
        email: json['email'],
        password: json['password']
      );
        
  }
}
