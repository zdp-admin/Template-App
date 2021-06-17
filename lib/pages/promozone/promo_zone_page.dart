import 'package:template/Services/rest_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/pages/promozone/bloc/promo_zone_bloc.dart';
import 'package:template/pages/promozone/widgets/list_promotions.dart';
import 'package:template/pages/promozone/widgets/select_state.dart';
import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/drawer_custom.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PromoZonePage extends StatefulWidget {
  @override
  PromoZoneState createState() => PromoZoneState();
}

class PromoZoneState extends State<PromoZonePage> {
  PromoZoneBloc bloc = new PromoZoneBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PreferencesUser pref = new PreferencesUser();

  @override
  void initState() {
    super.initState();
    this.pref.activeRoute = 'promo-zone';
    fetchPrmotions(bloc.state, bloc.type, first: true);
  }

  void fetchPrmotions(int state, int type, {first: false}) {
    if (bloc.state == state && bloc.type == type && !first) {
      return;
    }

    bloc.changeState(state);
    bloc.changeType(type);
    bloc.changeLoading(true);

    appService<RestService>().getPromotions(state, type).then((value) {
      bloc.changeListPromotions(value);

      if (value.length <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 3),
          content: Text('No se han encontrado resultados'),
        ));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
            onError is String ? onError : 'Error al consultar la información'),
      ));
    }).whenComplete(() {
      bloc.changeLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Promo Zone'),
      ),
      drawer: drawerCustom(context),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 140,
                child: Image(
                  image: AssetImage('assets/images/logo_promozone.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            selectState(context, bloc, fetchPrmotions),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: size.height - 340,
              child: listPromotions(context, bloc),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.shopping_cart, size: 20, color: Colors.white),
          Icon(Icons.restaurant, size: 20, color: Colors.white),
          FaIcon(FontAwesomeIcons.tools, size: 20, color: Colors.white),
          Icon(Icons.flight, size: 20, color: Colors.white),
          FaIcon(FontAwesomeIcons.futbol, size: 20, color: Colors.white)
        ],
        color: Color.fromRGBO(254, 211, 15, 1),
        buttonBackgroundColor: Color.fromRGBO(254, 211, 15, 1),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          fetchPrmotions(bloc.state, index + 1);
        },
      ),
    );
  }
}
