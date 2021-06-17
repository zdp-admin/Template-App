import 'package:template/pages/promozone/bloc/promo_zone_bloc.dart';
import 'package:flutter/material.dart';

Widget selectState(
    BuildContext context, PromoZoneBloc bloc, Function fetchPrmotions) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]),
    child: Row(
      children: [
        Icon(Icons.pin_drop, color: Color.fromRGBO(255, 137, 0, 1)),
        SizedBox(width: 15),
        Expanded(
          child: StreamBuilder(
            stream: bloc.stateStream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              return DropdownButton<int>(
                value: snapshot.data,
                underline: SizedBox(),
                isExpanded: true,
                hint: Text('Estado',
                    style: TextStyle(color: Colors.black.withAlpha(160))),
                onChanged: (value) {
                  fetchPrmotions(value, bloc.type);
                },
                items: [
                  DropdownMenuItem(child: Text('Aguascalientes'), value: 1),
                  DropdownMenuItem(child: Text('Baja California'), value: 2),
                  DropdownMenuItem(
                      child: Text('Baja California Sur'), value: 3),
                  DropdownMenuItem(child: Text('Campeche'), value: 4),
                  DropdownMenuItem(child: Text('Ciudad de México'), value: 9),
                  DropdownMenuItem(child: Text('Coahuila'), value: 5),
                  DropdownMenuItem(child: Text('Colimna'), value: 6),
                  DropdownMenuItem(child: Text('Chiapas'), value: 7),
                  DropdownMenuItem(child: Text('Chihuahua'), value: 8),
                  DropdownMenuItem(child: Text('Durango'), value: 10),
                  DropdownMenuItem(child: Text('Guanajuato'), value: 11),
                  DropdownMenuItem(child: Text('Guerrero'), value: 12),
                  DropdownMenuItem(child: Text('Hidalgo'), value: 13),
                  DropdownMenuItem(child: Text('Jalisco'), value: 14),
                  DropdownMenuItem(child: Text('México'), value: 15),
                  DropdownMenuItem(child: Text('Michoacán'), value: 16),
                  DropdownMenuItem(child: Text('Morelos'), value: 17),
                  DropdownMenuItem(child: Text('Nayarit'), value: 18),
                  DropdownMenuItem(child: Text('Nuevo León'), value: 19),
                  DropdownMenuItem(child: Text('Oaxaca'), value: 20),
                  DropdownMenuItem(child: Text('Puebla'), value: 21),
                  DropdownMenuItem(child: Text('Querétaro'), value: 22),
                  DropdownMenuItem(child: Text('Quintana Roo'), value: 23),
                  DropdownMenuItem(child: Text('San Luis Potosí'), value: 24),
                  DropdownMenuItem(child: Text('Sinaloa'), value: 25),
                  DropdownMenuItem(child: Text('Sonora'), value: 26),
                  DropdownMenuItem(child: Text('Tabasco'), value: 27),
                  DropdownMenuItem(child: Text('Tamaulipas'), value: 28),
                  DropdownMenuItem(child: Text('Tlaxcala'), value: 29),
                  DropdownMenuItem(child: Text('Veracruz'), value: 30),
                  DropdownMenuItem(child: Text('Yucatán'), value: 31),
                  DropdownMenuItem(child: Text('Zacatecas'), value: 32)
                ],
              );
            },
          ),
        )
      ],
    ),
  );
}
