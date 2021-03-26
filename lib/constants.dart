import 'package:flutter/material.dart';

class Constants {
  static Color primaryColor = Color(0xFF2454B5);
  static Color primaryColorDark = Color(0xFF232FB2);
  static Color shadowColor = Colors.grey.withOpacity(0.4);
  static Color black = Colors.black87.withOpacity(.7);
  static Color yellow = Colors.yellow[700];

  static Color lightOrange = Color(0xFFFFB992);
  static Color darkOrange = Color(0xFFFF9B9B);

  static Color lightPurple = Color(0xFFD693EB);
  static Color darkPurple = Color(0xFFA693EB);

  static Color lightBlue = Color(0xFF93DCEB);
  static Color darkBlue = Color(0xFF9DCEEC);

  static Color lightGreen = Color(0xFFBBEB92);
  static Color darkGreen = Color(0xFF89DD94);

  static BoxShadow boxShadow = BoxShadow(
    color: Constants.shadowColor,
    spreadRadius: 2,
    blurRadius: 9,
    offset: Offset(0, 3), // changes position of shadow
  );

  textWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 26.0,
        color: Constants.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
