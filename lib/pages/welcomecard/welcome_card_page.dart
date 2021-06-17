import 'package:template/pages/welcomecard/widgets/card.dart';
import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeCardPage extends StatefulWidget {
  @override
  WelcomeCardPageState createState() => new WelcomeCardPageState();
}

class WelcomeCardPageState extends State<WelcomeCardPage> {
  PreferencesUser pref = new PreferencesUser();

  @override
  void initState() {
    this.pref.activeRoute = 'welcome';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Tarjeta de beneficios'),
      ),
      drawer: drawerCustom(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.center,
                child: card(size),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    '*Toca la tarjeta para ver el reverso\n Remplaza la tarjeta por un .png de tu nueva tarjeta',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'La presente tarjeta brinda descuentos y privilegios exclusivos para los colaboradores de ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'NatureSweet.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Podrás encontrar todos los establecimientos en la pestaña ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Promo-Zone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ' o en la página de internet:',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () async {
                  await launch('http://www.promo-zone.com.mx');
                },
                child: Text(
                  'http://www.promo-zone.com.mx',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Image(
                    alignment: Alignment.bottomRight,
                    image: AssetImage('assets/images/logo_promozone.png'),
                    width: MediaQuery.of(context).size.width * .9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
