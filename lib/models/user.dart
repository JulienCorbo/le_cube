class User {
  final String token;
  final String email;
  final String firstname;
  final String lastname;
  final int roles;
  final int id;

  User({required this.token, required this.email, required this.firstname, required this.lastname, required this.roles, required this.id});


  factory User.fromJson(Map<String, dynamic> data){
    final token = data['token'] as String;
    final email = data['email'] as String;
    final firstname = data['firstname'] as String;
    final lastname = data['lastname'] as String;
    final roles = data['roles'] as int;
    final id = data['id'] as int;
    return User(token: token, email: email, firstname: firstname, lastname: lastname, roles: roles, id: id);
  }
}
