class User {
  final String token;
  final String email;
  final String firstname;
  final String lastname;
  final String roles;
  final String id;

  User({required this.token, required this.email, required this.firstname, required this.lastname, required this.roles, required this.id});


  factory User.fromJson(Map<String, dynamic> data){
    final token = data['accesToken'] as String;
    final email = data['email'] as String;
    final firstname = data['prenom'] as String;
    final lastname = data['nom'] as String;
    final roles = data['roles'] as String;
    final id = data['id'] as String;
    return User(token: token, email: email, firstname: firstname, lastname: lastname, roles: roles, id: id);
  }
}
