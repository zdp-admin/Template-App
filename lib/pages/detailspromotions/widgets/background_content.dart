import 'package:flutter/material.dart';

Widget backgroundContent(BuildContext context, String bgImage) {

  final size = MediaQuery.of(context).size;

  return Container(
    height: size.height * 0.4,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(bgImage),
        fit: BoxFit.cover
      )
    ),
  );
}