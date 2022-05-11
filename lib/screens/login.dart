import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/screens/signup.dart';
import 'package:le_cube/screens/home_page.dart';
import 'package:le_cube/models/user.dart';
import 'package:le_cube/utils/user_info.dart';

Future<int> logUser(BuildContext context, String pass, String mail) async {
  final response = await http.post(
    Uri.parse('https://ressource-relationnelle.herokuapp.com/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'user':{
        'email': mail,
        'mdp': pass,
      }
    }),
  );

  if (response.statusCode == 200) {

    final Map<String, dynamic> data = json.decode(response.body);
    final user = User.fromJson(data['res']);
    UserInfo.setUserToken(user.token);
    UserInfo.setUserEmail(user.email);
    UserInfo.setUserFirstname(user.firstname);
    UserInfo.setUserLastname(user.lastname);
    UserInfo.setUserRole(user.roles);
    UserInfo.setUserId(user.id);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage()
    ));

    return 1;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}


class Album {
  final String mail;
  final String pass;

  const Album({
    required this.mail,
    required this.pass
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      mail: json['mail'],
      pass: json['pass'],
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: blueBackground,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: 400,
        child: Form(
          key: _form,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 20,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 250,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'MAIL'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: passwordController,
                obscureText: true,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'MOT DE PASSE'),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  style: buttonWhite,
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      setState(() {
                      });
                    }
                  },
                  child: const Text('CONNEXION')
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  style: buttonBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: const Text('S\'INSCRIRE')
              ),
            ],
          ),
        ),
      )
    );
  }
}


