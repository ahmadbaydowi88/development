import 'package:app_kelas_pintar/theme.dart';
import 'package:flutter/material.dart';

Widget bottonAction(
    {String? title, TextStyle? style, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
        boxShadow: [shadowCard],
      ),
      child: Center(
        child: Text(
          title!,
          style: style,
        ),
      ),
    ),
  );
}

AppBar appBar(BuildContext context, {Function()? onTap, String? title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: primaryColor,
    title: Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 15,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title!,
            style: nunitoTextStyle,
          ),
        ),
      ],
    ),
  );
}
