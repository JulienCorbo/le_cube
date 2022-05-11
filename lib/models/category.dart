class ressourceCategory {
  final String name;
  final String id;
  final String icon;

  ressourceCategory({required this.name, required this.id, required this.icon});


  factory ressourceCategory.fromJson(Map<String, dynamic> data){
    final name = data['accesToken'] as String;
    final id = data['email'] as String;
    final icon = data['prenom'] as String;
    return ressourceCategory(name: name, id: id, icon: icon);
  }
}
