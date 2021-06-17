import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

Widget inputCheck(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.termAndConditionsStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.black),
                child: Checkbox(
                    value: snapshot.data ?? false,
                    onChanged: bloc.changeTermAndConditions,
                    checkColor: Colors.white,
                    activeColor: Color.fromRGBO(255, 137, 0, 1)),
              ),
              GestureDetector(
                onTap: () {
                  appService<NavigationService>()
                      .navigateTo('notice-privacity', arguments: true);
                },
                child: Text('Acepto el aviso de privacidad',
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(snapshot.error ?? '',
                  style: TextStyle(color: Colors.red, fontSize: 11)),
            ),
          )
        ],
      );
    },
  );
}
