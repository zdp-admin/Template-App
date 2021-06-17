import 'dart:async';
import 'dart:io';

import 'package:template/models/branch_office.dart';
import 'package:template/pages/listbranchs/widgets/card_branch.dart';
import 'package:template/pages/listbranchs/widgets/map_content.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as mapLaucher;

class ListBranchPage extends StatefulWidget {
  @override
  ListBranchState createState() => ListBranchState();
}

class ListBranchState extends State<ListBranchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BranchOffice branchOffice = new BranchOffice();
  Completer<GoogleMapController> controllerMap = Completer();
  Set<Marker> markers;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (branchOffice.brachs == null) {
      branchOffice = ModalRoute.of(context).settings.arguments as BranchOffice;

      if (branchOffice == null) {
        branchOffice = new BranchOffice();
        branchOffice.brachs = [];
      }

      setState(() {
        markers = new Set.from(branchOffice.brachs.map((branch) => Marker(
            markerId: MarkerId(branch.id.toString()),
            infoWindow: InfoWindow(
                title: branch.name,
                snippet:
                    '${branch?.address}, \n${branch?.colony},\n${branch?.zipCode},\n${branch?.municipality}, ${branch.state}'),
            position: LatLng(branch.latitud, branch.longitud))));
      });
    }
  }

  Future<void> goToInMap(double latitude, double longitud) async {
    final GoogleMapController controller = await controllerMap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitud), zoom: 17)));
  }

  void showDirection(double latitude, double longitud) {
    // ignore: deprecated_member_use
    Geolocator.getCurrentPosition()
        .then((value) => {
              mapLaucher.MapLauncher.showDirections(
                      mapType: Platform.isIOS
                          ? mapLaucher.MapType.apple
                          : mapLaucher.MapType.google,
                      origin:
                          mapLaucher.Coords(value.latitude, value.longitude),
                      destination: mapLaucher.Coords(latitude, longitud))
                  .catchError((onError) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('Error al mostrar la ruta'),
                ));
              })
            })
        .catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Error al obtener su ubicación'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Promo Zone'),
      ),
      body: Stack(
        children: [
          Container(
            child: mapContent(context, controllerMap, markers),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 253,
              child: ListView.builder(
                  itemBuilder: (BuildContext ctx, int index) {
                    return cardBranch(context, branchOffice.brachs[index],
                        goToInMap, showDirection);
                  },
                  itemCount: branchOffice.brachs.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics()),
            ),
          )
        ],
      ),
    );
  }
}
