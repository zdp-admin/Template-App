import 'dart:async';

import '../utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _cardNumberController = BehaviorSubject<String>();
  final _termAndConditionsController = BehaviorSubject<bool>();
  final _loadingController = BehaviorSubject<bool>();

  Stream<String> get cardNumberStream =>
      _cardNumberController.stream.transform(validateEmpty);
  Stream<bool> get termAndConditionsStream =>
      _termAndConditionsController.stream.transform(validTermAndConditions);
  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<bool> get formValidStream => Rx.combineLatest2(
      cardNumberStream, termAndConditionsStream, (a, b) => true);

  Function(String) get changeCardNumber => _cardNumberController.sink.add;
  Function(bool) get changeTermAndConditions =>
      _termAndConditionsController.sink.add;
  Function(bool) get changeLoading => _loadingController.sink.add;

  String get cardNumber => _cardNumberController.value;
  bool get termAndConditions => _termAndConditionsController.value;
  bool get loading => _loadingController.value;

  LoginBloc() {
    this._loadingController.sink.add(false);
  }

  dispose() {
    _termAndConditionsController?.close();
    _loadingController?.close();
    _cardNumberController?.close();
  }
}
