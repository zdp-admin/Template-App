import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppSettings {
  String apiUrl;
  String apiUrlApiPz;
  String apiUrlPz;
  String linkImagePz;

  ThemeData appTheme;
  List<Locale> locales;
  Map<String, String> headers;
  //DateFormat dateFormat;

  AppSettings() {
    this.apiUrl = 'tusprivilegios.com';
    this.apiUrlApiPz =
        'https://www.tusprivilegios.com/RETAIL/2G/RESTFUL/Perfil/PerfilRestController.php/';
    this.apiUrlPz =
        'https://www.tusprivilegios.com/RETAIL/JURGEN/RESTFUL/Perfil/pz.php/';
    this.linkImagePz = 'https://promo-zone.com.mx/';

    this.appTheme = ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        fontFamily: 'BMWMotorrad',
        accentColor: Colors.white);
    this.locales = [const Locale('es')];
    this.headers = {
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
    };
    //this.dateFormat = new DateFormat('dd-MMMM-yyyy', 'es_MX');
  }

  DateFormat get dateFormat {
    return new DateFormat('dd-MMMM-yyyy', 'es_MX');
  }
}
