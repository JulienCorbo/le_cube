import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



final textInputDecoration = InputDecoration(
    labelStyle: GoogleFonts.zenKurenaido(
      textStyle: const TextStyle(color: bleu_fond),
    ),
    hintStyle: GoogleFonts.zenKurenaido(
      textStyle: const TextStyle(color: bleu_fond),
    ),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: bleu_btn, width: 2)
    )
);

const bleu_btn = Color(0xFF0741AD);
const bleu_fond = Color(0xFF265CB8);
const bleu_txt = Color(0xFF5880C9);