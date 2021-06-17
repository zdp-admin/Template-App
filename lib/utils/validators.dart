import 'dart:async';

class Validators {

  final validEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {

      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email no es valido');
      }
    }
  );

  final validPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {

      if (password.length > 0) {
        sink.add( password );
      } else {
        sink.addError('Ingrese una contraseña');
      }
    }
  );

  final validateEmpty = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (value.length > 0 && value != null) {
        sink.add(value);
      } else {
        sink.addError('El campo es requerido');
      }
    }
  );

  final validateDate = StreamTransformer<DateTime, DateTime>.fromHandlers(
    handleData: (value, sink) {
      if (value != null) {
        sink.add(value);
      } else {
        sink.addError('El campo es requerido');
      }
    }
  );

  final validTermAndConditions = StreamTransformer<bool, bool>.fromHandlers(
    handleData: (value, sink) {
      if (value ?? false) {
        sink.add(value);
      } else {
        sink.addError('Es necesario aceptar el aviso de privacidad');
      }
    }
  );
}