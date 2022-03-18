import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:le_cube/screens/login.dart';
import 'package:le_cube/commons/constants.dart';


Future<int> createAlbum(BuildContext context,String name, String firstname, String pass, String mail) async {
  final response = await http.post(
    Uri.parse('https://ressource-relationnelle.herokuapp.com/user/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nom': name,
      'prenom': firstname,
      'mdp': pass,
      'email': mail,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Login()
    ));
    print(response.body);
    return 1;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String name;
  final String firstname;
  final String mail;
  final String pass;

  const Album({
    required this.name,
    required this.firstname,
    required this.mail,
    required this.pass
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['nom'],
      firstname: json['firstname'],
      mail: json['mail'],
      pass: json['pass'],
    );
  }
}


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  String error = '';
  Future<int>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBackground,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: 400,
        child: Form(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.center,
            runSpacing: 20,
            children: <Widget>[
              Text(
                'INSCRIPTION',
                style: GoogleFonts.zenKurenaido(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    )
                ),
              ),
              TextFormField(
                controller: nameController,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'NOM'),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: firstnameController,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'PRENOM'),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'EMAIL'),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'MOT DE PASSE'),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: blueText,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'CONFIRMATION MOT DE PASSE'),
              ),
              const SizedBox(height: 10,),
              Text(
                error,
                style: errorTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(width: double.infinity,),
              ElevatedButton(
                  style: buttonWhite,
                  onPressed: () {
                    setState(() {
                      _futureAlbum = createAlbum(
                        context,
                        nameController.value.text,
                        firstnameController.value.text,
                        emailController.value.text,
                        passwordController.value.text
                      );
                    });
                  },
                  child: const Text('INSCRIPTION')
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  style: buttonBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text('SE CONNECTER')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
