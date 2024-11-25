import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/sizeconfig/sizeconig.dart';

class Appstyle {
  static Color bgcolor = Colors.white ;
  static Color maincolor = Colors.black ;
  static Color accentcolor = Colors.blue;
  
  static List<Color> cardscolor = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.cyan,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.yellow.shade200,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.lightGreenAccent,
  ];
  static TextStyle maintittle = GoogleFonts.roboto (
    fontSize: Sizeconig.defaultsize! * 2.3,
    fontWeight: FontWeight.w800,
  ) ;
  static TextStyle maincontent = GoogleFonts.nunito (
    fontSize: Sizeconig.defaultsize! * 2,
    fontWeight: FontWeight.w500,
  ) ;
  static TextStyle datetittle = GoogleFonts.roboto (
    fontSize: Sizeconig.defaultsize! * 1.8,
    fontWeight: FontWeight.w300,
  ) ;
   static TextStyle til = GoogleFonts.playfairDisplay (
    fontSize: Sizeconig.defaultsize! * 3,
    //fontWeight: FontWeight.bold,
  ) ;
  // ignore: non_constant_identifier_names
  static TextStyle no_found = GoogleFonts.aclonica (
    fontSize: Sizeconig.defaultsize! * 1.9,
    fontWeight: FontWeight.w600,
  ) ;
}