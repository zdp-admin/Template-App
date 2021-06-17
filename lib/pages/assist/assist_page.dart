import 'package:template/utils/preference_user.dart';
import 'package:flutter/material.dart';
import 'package:template/widgets/drawer_custom.dart';

class AssistPage extends StatefulWidget {
  @override
  AssistPageState createState() => new AssistPageState();
}

class AssistPageState extends State<AssistPage> {
  PreferencesUser pref = new PreferencesUser();

  @override
  void initState() {
    this.pref.activeRoute = 'assits';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Asistencias'),
      ),
      drawer: drawerCustom(context),
      body: Center(
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          alignment: Alignment.center,
          child: Text(
            '''En caso de requerir un servicio de asistencia comunicate 24/7 al
            55 5747 91114 o 800 890 9366''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
