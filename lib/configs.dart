import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String sampleText = 'Sample さんぷる';
const String longText = 'TESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTEST';
final TextStyle textStyleNotoSans = GoogleFonts.getFont('Noto Sans');
final TextStyle textStyleNotoSerif = GoogleFonts.getFont('Noto Serif');
final TextStyle textStyleMPlusRound1c =
    GoogleFonts.getFont('M PLUS Rounded 1c');
final TextStyle textStyleMPlus1p = GoogleFonts.getFont('M PLUS 1p');
final TextStyle textStyleSawarabiMincho =
    GoogleFonts.getFont('Sawarabi Mincho');
final TextStyle textStyleSawarabiGothic =
    GoogleFonts.getFont('Sawarabi Gothic');
final TextStyle textStyleKosugiMaru = GoogleFonts.getFont('Kosugi Maru');
final TextStyle textStyleKosugi = GoogleFonts.getFont('Kosugi');
final TextStyle textStyleShipporiMincho =
    GoogleFonts.getFont('Shippori Mincho');
final TextStyle textStyleMochiyPopOne = GoogleFonts.getFont('Mochiy Pop One');
final TextStyle textStyleDelaGothicOne = GoogleFonts.getFont('Dela Gothic One');
// final TextStyle textStyleKiwiMaru = GoogleFonts.getFont('Kiwi Maru'); // <- not exist

List<TextStyle> get textStyleList => [
      textStyleNotoSans,
      textStyleNotoSerif,
      textStyleMPlusRound1c,
      textStyleMPlus1p,
      textStyleSawarabiMincho,
      textStyleSawarabiGothic,
      textStyleKosugiMaru,
      textStyleKosugi,
      textStyleShipporiMincho,
      textStyleMochiyPopOne,
      textStyleDelaGothicOne,
      // textStyleKiwiMaru,
    ];
    
final Map<String, String> fontFamilyToDisplayName = {
  'NotoSans_regular': 'Noto Sans',
  'NotoSerif_regular': 'Noto Serif',
  'MPLUSRounded1c_regular': 'M PLUS Rounded 1c',
  'MPLUS1p_regular': 'M PLUS 1p',
  'SawarabiMincho_regular': 'Sawarabi Mincho',
  'SawarabiGothic_regular': 'Sawarabi Gothic',
  'KosugiMaru_regular': 'Kosugi Maru',
  'Kosugi_regular': 'Kosugi',
  'ShipporiMincho_regular': 'Shippori Mincho',
  'MochiyPopOne_regular': 'Mochiy Pop One',
  'DelaGothicOne_regular': 'Dela Gothic One',
  // 'KiwiMaru_regular' : 'Kiwi Maru',
};
