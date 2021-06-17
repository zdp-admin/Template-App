import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

Widget card(Size size) {
  return Container(
    width: size.width * 0.8,
    child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 300,
      front: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5), offset: Offset(0, 0), blurRadius: 10)
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image(image: AssetImage('assets/images/tarjeta.png'), fit: BoxFit.cover),
        ),
      ),
      back: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5), offset: Offset(0, 0), blurRadius: 10)
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image(image: AssetImage('assets/images/tarjeta-reverso.png'), fit: BoxFit.cover),
        ),
      ),
    ),
  );
}