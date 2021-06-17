import 'package:flutter/material.dart';
import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/utils/preference_user.dart';

class StartUpViewModel extends ChangeNotifier {
  final PreferencesUser _pref = new PreferencesUser();
  final NavigationService _navigationService = appService<NavigationService>();

  Future<void> handleStartUp() async {
    bool loggedUser = _pref.logged;

    //await Future.delayed(Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 2500));

    if (loggedUser) {
      _navigationService.navigateToAndRemoveHistory('profile');
    } else {
      _navigationService.navigateToAndRemoveHistory('login');
    }
  }
}
