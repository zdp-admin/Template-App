import 'dart:convert';
import 'dart:io';

import 'package:template/Services/setup_service.dart';
import 'package:template/models/branch_office.dart';
import 'package:template/models/promotion.dart';
import 'package:template/utils/app_settings.dart';
import 'package:template/utils/preference_user.dart';
import 'package:http/http.dart' as http;

class RestService {
  String apiUrl;
  String apiUrlApiPz;
  String apiUrlPz;
  PreferencesUser pref;

  RestService() {
    this.apiUrl = appService<AppSettings>().apiUrl;
    this.apiUrlApiPz = appService<AppSettings>().apiUrlApiPz;
    this.apiUrlPz = appService<AppSettings>().apiUrlPz;
    this.pref = new PreferencesUser();
  }

  Future<List<Promotion>> getPromotions(int state, int category) async {
    final response = await http.post(
        Uri.parse('${this.apiUrlPz}obtenerPromociones'),
        body: {'estado': state.toString(), 'categoria': category.toString()},
        headers: this.headers());

    if (response.statusCode == 200) {
      var responseParse = jsonDecode(response.body);
      Iterable iterable = responseParse['promocion'] ?? [];

      List<Promotion> promotions =
          iterable.map((promotion) => Promotion.fromJson(promotion)).toList();

      return promotions;
    }

    throw ('Error al consultar la información');
  }

  Future<BranchOffice> getBranchOffice(int id) async {
    final response = await http.post(
        Uri.parse('${this.apiUrlApiPz}obtenerEstablecimiento'),
        body: {'id': id.toString()},
        headers: this.headers());

    if (response.statusCode == 200 && response.body != "") {
      var responseParse = jsonDecode(response.body);

      BranchOffice branchOffice =
          BranchOffice.fromJson(responseParse['establecimiento']);

      return branchOffice;
    }

    throw ('Error al consultar la información');
  }

  Map<String, String> headers() {
    return {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'};
  }
}
