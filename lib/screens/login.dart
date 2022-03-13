import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bleu_fond,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: 400,
        child: Form(
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
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: bleu_txt,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'NOM D\'UTILISATEUR'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: GoogleFonts.zenKurenaido(
                  textStyle: const TextStyle(
                    color: bleu_txt,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'MOT DE PASSE'),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.zenKurenaido(
                        textStyle: const TextStyle(fontSize: 23),
                      ),
                      primary: Colors.white,
                      onPrimary: bleu_txt,
                      fixedSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: () {} ,
                  child: const Text('CONNEXION')
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.zenKurenaido(
                          textStyle: const TextStyle(fontSize: 17)
                      ),
                      primary: bleu_btn,
                      onPrimary: Colors.white,
                      fixedSize: const Size(250, 50),
                      side: const BorderSide(color: Colors.white, width: 0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signup()),
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


