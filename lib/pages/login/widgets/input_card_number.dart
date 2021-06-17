import 'package:template/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

Widget inputEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.cardNumberStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).primaryColorLight,
            prefixIcon: Icon(Icons.credit_card),
            labelText: 'Numero de tarjeta',
            errorText: snapshot.error),
        onChanged: bloc.changeCardNumber,
      );
    },
  );
}
