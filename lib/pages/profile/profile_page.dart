import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<ProfilePage> {
  PreferencesUser pref = new PreferencesUser();

  @override
  void initState() {
    this.pref.activeRoute = 'profile';
    super.initState();
  }

  double widthImage(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 8;
    return width > 500 ? 500 : width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Perfil'),
      ),
      drawer: drawerCustom(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Image(
                    image: AssetImage('assets/images/YourLogoHere1.png'),
                    width: widthImage(context)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''Lorem Ipsum''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
