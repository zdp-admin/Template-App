import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instance = new PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get cardNumber {
    return _prefs.getString('card_number') ?? '';
  }

  set cardNumber(String value) {
    _prefs.setString('card_number', value);
  }

  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get lastName {
    return _prefs.getString('last_name') ?? '';
  }

  set lastName(String value) {
    _prefs.setString('last_name', value);
  }

  get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  get expirationDate {
    return _prefs.getString('expiration_date') ?? '';
  }

  set expirationDate(String value) {
    _prefs.setString('expiration_date', value);
  }

  get registrationDate {
    return _prefs.getString('registration_date') ?? '';
  }

  set registrationDate(String value) {
    _prefs.setString('registration_date', value);
  }

  get status {
    return _prefs.getString('status');
  }

  set status(String value) {
    _prefs.setString('status', value);
  }

  get noticeOfPrivacy {
    return _prefs.getString('notice_of_privacy');
  }

  set noticeOfPrivacy(String value) {
    _prefs.setString('notice_of_privacy', value);
  }

  get uuid {
    return _prefs.getString('uuid') ?? null;
  }

  set uuid(String value) {
    _prefs.setString('uuid', value);
  }

  get frontImage {
    return _prefs.getString('front_image') ?? '';
  }

  set frontImage(String value) {
    _prefs.setString('front_image', value);
  }

  get backImage {
    return _prefs.getString('back_image') ?? '';
  }

  set backImage(String value) {
    _prefs.setString('back_image', value);
  }

  get logged {
    return _prefs.getBool('logged') ?? false;
  }

  set logged(bool value) {
    _prefs.setBool('logged', value);
  }

  get activeRoute {
    return _prefs.getString('active_router') ?? '';
  }

  set activeRoute(String value) {
    _prefs.setString('active_router', value);
  }

  get tokenDevice {
    return _prefs.getString('token_device') ?? '';
  }

  set tokenDevice(String value) {
    _prefs.setString('token_device', value);
  }
}
