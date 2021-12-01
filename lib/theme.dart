import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xFF002984);
Color secondaryColor = Color(0xFF006C84);
Color whiteColor = Color(0xFFFFFFFF);
Color blackColor = Color(0xFF000000);
Color greyColor = Color(0xFFE0E0E0);
Color shadowColor = Color(0xFF002984).withOpacity(0.25);

FontWeight bold = FontWeight.w700;
FontWeight semiBold = FontWeight.w600;
FontWeight medium = FontWeight.w500;

TextStyle nunitoTextStyle = GoogleFonts.nunito(
  color: whiteColor,
);

BoxShadow shadowCard = BoxShadow(
  offset: Offset(4, 4),
  blurRadius: 8,
  color: shadowColor,
);
