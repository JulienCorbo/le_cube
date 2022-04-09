import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final buttonWhite = ElevatedButton.styleFrom(
    textStyle: GoogleFonts.zenKurenaido(
      textStyle: const TextStyle(fontSize: 18),
    ),
    primary: Colors.white,
    onPrimary: blueText,
    fixedSize: const Size(250, 50),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    )
);

final buttonBlue = ElevatedButton.styleFrom(
    textStyle: GoogleFonts.zenKurenaido(
        textStyle: const TextStyle(fontSize: 18)
    ),
    primary: blueButton,
    onPrimary: Colors.white,
    fixedSize: const Size(250, 50),
    side: const BorderSide(color: Colors.white, width: 0.7),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    )
);

final textInputDecoration = InputDecoration(
    labelStyle: GoogleFonts.zenKurenaido(
      textStyle: const TextStyle(color: blueBackground),
    ),
    hintStyle: GoogleFonts.zenKurenaido(
      textStyle: const TextStyle(color: blueBackground),
    ),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: blueButton, width: 2)
    )
);

final errorTextStyle = GoogleFonts.zenKurenaido(
    textStyle: const TextStyle(
      color: Colors.red,
    )
);

final textStyle = GoogleFonts.zenKurenaido(
  textStyle: const TextStyle(
    color: blueText,
  ),
);

Widget categoryElementPage({
  required String title,
  required IconData? icon,
}) => Container(
    width: 170,
    height: 170,
    decoration: BoxDecoration(
      border: Border.all(width: 2.0, color: blueBorder),
      borderRadius: BorderRadius.circular(25),
    ),
    child: SizedBox.fromSize(
      size: Size(56, 56),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: blueText, // splash color
        onTap: () {}, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: blueIcon,
              size: 64,
            ),
            const SizedBox(height: 10),
            Text(
                title,
                style: textStyle.copyWith(fontSize: 22)
            ),
          ],
        ),
      ),
    )
);

Widget spotlightElement({
  required String title,
  required String category,
  required IconData? icon,
}) => ClipRect(
  child:
  Container(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
    width: 400,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        const SizedBox(height: 10, width: double.infinity),
        Icon(
          icon,
          color: blueIcon,
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
            category,
            style: textStyle.copyWith(fontSize: 25)
        ),
        const SizedBox(height: 5, width: double.infinity,),
        const Divider(
            thickness: 2,
            color: blueBorder
        ),
        const SizedBox(width: double.infinity),
        Text(
          title,
          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10, width: double.infinity),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget enim leo. Sed eu tortor malesuada enim feugiat tincidunt. Cras viverra lorem quis pulvinar aliquam. Mauris posuere, libero et tempus luctus, tortor nibh viverra quam, a congue ex erat nec sem. Morbi quis eleifend turpis. ',
          style: textStyle.copyWith(fontSize: 14),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20, width: double.infinity),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 48,
              onPressed: () {},
              icon: const Icon(Icons.star_outline_rounded),
              color: blueButton,
            ),
            const SizedBox(width: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: GoogleFonts.zenKurenaido(
                        textStyle: const TextStyle(fontSize: 14)
                    ),
                    primary: blueButton,
                    onPrimary: Colors.white,
                    fixedSize: const Size(120, 30),
                    side: const BorderSide(color: Colors.white, width: 0.7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: () {},
                child: Text('VOIR PLUS')
            )
          ],
        ),

      ],
    ),
  ),
);

Widget categoryElement({
  required IconData? icon,
  required String categoryTitle,
  required String nbrRessource,
}) => ClipRect(
    child: Container(
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: blueBorder),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          const SizedBox(height: 15, width: double.infinity),
          Icon(
            icon,
            color: blueIcon,
            size: 80,
          ),
          const SizedBox(width: double.infinity),
          Text(
            categoryTitle,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.zenKurenaido(
              textStyle: const TextStyle(
                color: blueText,
                fontSize: 25,
              ),
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec euismod eros. Sed interdum orci lacus, vitae facilisis augue laoreet in. Suspendisse sit amet orci mauris.',
            style: textStyle.copyWith(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10, width: double.infinity),
          Text(
            nbrRessource,
            style: textStyle.copyWith(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 10),
          Text(
            'Ressources',
            style: textStyle.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10, width: double.infinity),
          ElevatedButton(
              style: buttonWhite,
              onPressed: () {},
              child: const Text('VOIR PLUS')
          )
        ],
      ),
    )
);

void fav_button() {

}

const blueButton = Color(0xFF0741AD);
const blueBackground = Color(0xFF265CB8);
const blueBorder = Color(0xFF265CB8);
const blueIcon = Color(0xFF265CB8);
const blueText = Color(0xFF5880C9);
const whiteBackground = Color(0xFFF7F9F9);

const bleu_btn = Color(0xFF0741AD);
const bleu_fond = Color(0xFF265CB8);
const bleu_txt = Color(0xFF5880C9);
const blanc_fond = Color(0xFFF7F9F9);