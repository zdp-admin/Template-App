import 'dart:convert';
import 'dart:io';

import 'package:template/Services/setup_service.dart';
import 'package:template/models/auth_response.dart';
import 'package:template/utils/app_settings.dart';
import 'package:template/utils/preference_user.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:device_info/device_info.dart';

class AuthService {
  String apiUrl;
  PreferencesUser pref;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  AuthService() {
    this.apiUrl = appService<AppSettings>().apiUrl;
    this.pref = new PreferencesUser();
  }

  Future<bool> auth(String card) async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        this.pref.uuid = deviceData['androidId'];
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        this.pref.uuid = deviceData['identifierForVendor'];
      }
    } on Exception {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    log(deviceData.values.toString());

    var body = new Map<String, String>();
    body['Numero_Tarjeta'] = card;
    body['UUID'] = this.pref.tokenDevice ?? '0';

    final response = await http.post(Uri.parse('${this.apiUrl}login'),
        body: body, headers: this.headers());

    if (response.statusCode == 200 && response.body != "") {
      AuthResponse authResponse =
          new AuthResponse.fromJson(jsonDecode(response.body));

      if (authResponse.cardNumber == '') {
        if (authResponse.error != "") {
          throw (authResponse.error);
        } else {
          throw ('Error al iniciar sesión');
        }
      }

      this.pref.cardNumber = authResponse.cardNumber;
      this.pref.name = authResponse.name;
      this.pref.lastName = authResponse.lastName;
      this.pref.email = authResponse.emai;
      this.pref.expirationDate = authResponse.expirationDate;
      this.pref.registrationDate = authResponse.registrationDate;
      this.pref.status = authResponse.status;
      this.pref.uuid = authResponse.uuid;
      this.pref.noticeOfPrivacy = authResponse.noticeOfPrivacy;
      this.pref.backImage = authResponse.backImage;
      this.pref.frontImage = authResponse.frontImage;
      this.pref.logged = true;

      return true;
    } else {
      throw ('Error al iniciar sesión');
    }
  }

  void loggout() {
    this.pref.logged = false;
    this.pref.cardNumber = '';
    this.pref.name = '';
    this.pref.lastName = '';
    this.pref.email = '';
    this.pref.expirationDate = '';
    this.pref.registrationDate = '';
    this.pref.status = '';
    this.pref.noticeOfPrivacy = '';
    this.pref.backImage = '';
    this.pref.frontImage = '';
  }

  Map<String, String> headers() {
    return {
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      HttpHeaders.authorizationHeader: 'Basic UXVhbGl0eTpFNyQmOEJzZHhzQTQ='
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
