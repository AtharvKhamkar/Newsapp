import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  Entertainment,
  topTrending,
  Business,
  General,
  Health,
  Science,
  Sport,
  Technology
  

}

enum SortByEnum {
  relvancy,
  popularity,
  publishedAt,
}

TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15);

List<String> searchkeyWords = [
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Youtube",
  "NetFllix",
  "Meta"
];
