class RessourceCategory {
  final String name;
  final String id;
  final String icon;

  RessourceCategory({required this.name, required this.id, required this.icon});


  factory RessourceCategory.fromJson(Map<String, dynamic> data){
    final name = data['accesToken'] as String;
    final id = data['email'] as String;
    final icon = data['prenom'] as String;
    return RessourceCategory(name: name, id: id, icon: icon);
  }
}
