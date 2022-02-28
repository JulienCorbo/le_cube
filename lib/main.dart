import 'package:flutter/material.dart';
import 'package:le_cube/commons/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bleu_fond,
      body: Center(
        child: Container(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 250,
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: GoogleFonts.openSansCondensed(
                  textStyle: const TextStyle(
                    color: bleu_txt,
                    fontSize: 23,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'NOM D\'UTILISATEUR'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: GoogleFonts.openSansCondensed(
                  textStyle: const TextStyle(
                    color: bleu_txt,
                    fontSize: 23,
                  ),
                ),
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(hintText: 'MOT DE PASSE'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.openSansCondensed(
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
                      textStyle: GoogleFonts.openSansCondensed(
                          textStyle: const TextStyle(fontSize: 23)
                      ),
                      primary: bleu_btn,
                      onPrimary: Colors.white,
                      fixedSize: const Size(250, 50),
                      side: const BorderSide(color: Colors.white, width: 0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                  ),

                  onPressed: () {} ,
                  child: const Text('S\'INSCRIRE')
              ),
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}
