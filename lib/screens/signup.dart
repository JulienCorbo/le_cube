import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:form_validator/form_validator.dart';

import 'package:le_cube/screens/login.dart';
import 'package:le_cube/commons/constants.dart';


Future<int> createAlbum(BuildContext context,String name, String firstname, String pass, String mail) async {
  final response = await http.post(
    Uri.parse('https://ressource-relationnelle.herokuapp.com/user/new'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
        'user':{
          'nom': name,
          'prenom': firstname,
          'mdp': pass,
          'email': mail,
        }
    }),
  );

  if (response.statusCode == 200) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Login()
    ));
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


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  String error = '';

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
                validator: ValidationBuilder().regExp(RegExp(r'^[A-Za-z][A-Za-z0-9_]{4,29}$'), nameController.value.text).build(),
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.next,
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
                validator: ValidationBuilder().email('Format du mail incorrect.').build(),
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.next,
                obscureText: true,
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
                textInputAction: TextInputAction.done,
                obscureText: true,
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
                    if (_form.currentState!.validate()) {
                      setState(() {
                      });
                    }
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
