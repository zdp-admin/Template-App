import 'package:flutter/material.dart';

Widget contentLogo(BuildContext context, String logo) {

  final size = MediaQuery.of(context).size;

  return Column(
    children: [
      SafeArea(
        child: Container(
          height: size.height * 0.3,
        ),
      ),
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3.0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 3.0
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.network(logo, fit: BoxFit.fill),
        ),
      )
    ],
  );
}