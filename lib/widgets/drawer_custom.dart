import 'package:template/Services/auth_service.dart';
import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/utils/app_settings.dart';
import 'package:template/utils/preference_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer drawerCustom(BuildContext context) {
  PreferencesUser pref = new PreferencesUser();

  colorIcon(String route) {
    return pref.activeRoute == route
        ? Color.fromRGBO(255, 137, 0, 1)
        : Colors.black;
  }

  void showAlert(BuildContext context, String title, String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      appService<AuthService>().loggout();
                      appService<NavigationService>()
                          .navigateToAndRemoveHistory('login');
                    },
                  ),
                ]));
  }

  return Drawer(
    child: Container(
      color: appService<AppSettings>().appTheme.accentColor,
      child: ListView(
        children: [
          //---------Eliminar signo ! para validar login-----------------------
          if (!pref.logged) ...[
            DrawerHeader(
              //decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              decoration: BoxDecoration(color: Color.fromRGBO(254, 211, 15, 1)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Image(
                      image: AssetImage('assets/images/YourLogoHere.png')),
                ),
              ),
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.person, color: colorIcon('profile')),
              onTap: () {
                if (pref.logged) {
                  appService<NavigationService>().navigateTo('profile');
                } else {
                  appService<NavigationService>().navigateTo('login');
                }
              },
            ),
            Divider(),
            ListTile(
              title: Text('Tarjeta de beneficios',
                  style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.credit_card, color: colorIcon('welcome')),
              onTap: () {
                appService<NavigationService>().navigateTo('welcome');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Promo Zone', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.label, color: colorIcon('promo-zone')),
              onTap: () {
                appService<NavigationService>().navigateTo('promo-zone');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Aviso de privacidad',
                  style: TextStyle(color: Colors.black)),
              leading: FaIcon(FontAwesomeIcons.bookmark,
                  color: colorIcon('notice-privacity')),
              onTap: () {
                appService<NavigationService>().navigateTo('notice-privacity');
              },
            ),
            Divider(),
            ListTile(
              title:
                  Text('Cerrar sesión', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.login, color: Colors.black),
              onTap: () {
                showAlert(context, 'Sesion', '¿Estas seguro de cerrar sesion?');
              },
            ),
            Divider()
          ],
        ],
      ),
    ),
  );
}
