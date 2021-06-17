import 'package:template/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

Widget buttonSubmit(LoginBloc bloc, Function(LoginBloc, BuildContext) submit,
    BuildContext context) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
            stream: bloc.loadingStream,
            builder: (BuildContext ctx, AsyncSnapshot sht) {
              return !sht.hasData || sht.data
                  ? Align(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    )
                  : Center(child: Text('INGRESAR'));
            },
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            primary: Color.fromRGBO(255, 0, 0, .8),
            textStyle: TextStyle(color: Colors.white)),
        onPressed: snapshot.hasData && !bloc.loading
            ? () => submit(bloc, context)
            : null,
      );
    },
  );
}
