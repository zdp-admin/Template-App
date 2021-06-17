import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

Widget card(Size size, String urlfront, String urlback) {
  return Container(
    width: size.width * 0.8,
    child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 300,
      front: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0, 0),
              blurRadius: 10)
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image(
              image: AssetImage('assets/images/tarjeta.png'),
              fit: BoxFit.cover),
          /*
            child: FadeInImage(
              image: NetworkImage(urlfront),
              placeholder: AssetImage('assets/images/tarjeta.png'),
              fit: BoxFit.cover,
              imageErrorBuilder:
                  (BuildContext ctxerror, Object obj, StackTrace stack) {
                return SizedBox(
                    child:
                        Image(image: AssetImage('assets/images/tarjeta.png')),
                    height: 80,
                    width: 100);
              },
            
            )*/
        ),
      ),
      back: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0, 0),
              blurRadius: 10)
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image(
              image: AssetImage('assets/images/tarjeta.png'),
              fit: BoxFit.cover),
          /*child: FadeInImage(
              image: NetworkImage(urlback),
              placeholder: AssetImage('assets/images/tarjeta.png'),
              fit: BoxFit.cover,
              imageErrorBuilder:
                  (BuildContext ctxerror, Object obj, StackTrace stack) {
                return SizedBox(
                    child:
                        Image(image: AssetImage('assets/images/tarjeta.png')),
                    height: 80,
                    width: 100);
              },
            )*/
        ),
      ),
    ),
  );
}
