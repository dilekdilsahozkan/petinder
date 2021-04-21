import 'package:flutter/material.dart';

final TextStyle fadedTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Color(0x99FFFFFF),
);

final TextStyle appBarTextStyle = TextStyle(
  fontFamily: "Playball-Regular",
  fontSize: 32,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  wordSpacing: 2.6
);

final TextStyle whiteHeadingTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

final TextStyle categoryTextStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final TextStyle selectedCategoryTextStyle = categoryTextStyle.copyWith(
  color: Colors.black,
);

final TextStyle eventTitleTextStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF000000),
);

final TextStyle eventWhiteTitleTextStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 38.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

final TextStyle eventLocationTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF000000),
);

final TextStyle guestTextStyle = TextStyle(
  fontFamily: 'Playfair',
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
  color: Color(0xFF000000),
);

final TextStyle punchLine1TextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w800,
  color: Color(0xffffe413),
);

final TextStyle punchLine2TextStyle = punchLine1TextStyle.copyWith(color: Color(0xFF000000));