//import 'package:template/Services/auth_service.dart
import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/blocs/login_bloc.dart';
import 'package:template/pages/login/widgets/button_submit.dart';
import 'package:template/pages/login/widgets/input_card_number.dart';
import 'package:template/pages/login/widgets/input_check.dart';
import 'package:template/providers/provider.dart';
import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    PreferencesUser pref = new PreferencesUser();

    pref.activeRoute = 'login';
  }

  void submit(LoginBloc bloc, BuildContext context) {
    //bloc.changeLoading(true);
    appService<NavigationService>().navigateToAndRemoveHistory('profile');
    //---------Implementar el siguiente códicgo para iniciar sesión con la api de la app------------------

    /*appService<AuthService>().auth(bloc.cardNumber).then((value) {
      if (value) {
        appService<NavigationService>().navigateToAndRemoveHistory('profile');
      } else {
        this.showAlert(context, 'Error', 'Error al iniciar sesion');
      }
    }).catchError((onError) {
      this.showAlert(
          context, 'Error', onError is String ? onError : 'Verifica tus datos');
    }).whenComplete(() {
      bloc.changeLoading(false);
    });*/
  }

  void showAlert(BuildContext context, String title, String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
              title: Text(title),
              content: Text(message),
            ));
  }

  double widthImage(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 8;
    return width > 400 ? 400 : width;
  }

  @override
  Widget build(BuildContext context) {
    final formControl = Provider.of(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 211, 15, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Iniciar sesión'),
        automaticallyImplyLeading: false,
      ),
      drawer: drawerCustom(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Image(
                    image: AssetImage('assets/images/YourLogoHere1.png'),
                    width: widthImage(context)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: inputEmail(formControl),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: inputCheck(formControl),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: buttonSubmit(formControl, submit, context),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('exit login');
    super.dispose();
  }
}
