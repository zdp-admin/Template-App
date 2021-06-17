import 'package:template/models/branch.dart';
import 'package:flutter/material.dart';

Widget cardBranch(
    BuildContext context,
    Branch branch,
    Function(double latitud, double longitud) goToInMap,
    Function(double latitud, double longitud) showDirection) {
  return Container(
    width: 350,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(branch?.name ?? '',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.w700)),
                  if (branch?.telephone != '')
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(branch.telephone.trimRight().trimLeft(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12)),
                    )
                ],
              ),
              Divider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(branch?.address ?? '',
                        style: TextStyle(fontSize: 10.5)),
                    if (branch?.colony != '')
                      Text('Colonia ' + (branch?.colony ?? ''),
                          style: TextStyle(fontSize: 10.5)),
                    if (branch?.zipCode != '')
                      Text('C.P ' + (branch?.zipCode ?? ''),
                          style: TextStyle(fontSize: 10.5)),
                    Text(
                        (branch?.municipality ?? '') +
                            ', ' +
                            (branch?.state ?? ''),
                        style: TextStyle(fontSize: 10.5))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor, elevation: 0),
                    onPressed: () =>
                        showDirection(branch.latitud, branch.longitud),
                    child: Row(
                      children: [
                        Icon(Icons.navigation, color: Colors.white, size: 12),
                        SizedBox(width: 3),
                        Text('INDICACIONES',
                            style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor, elevation: 0),
                    onPressed: () => goToInMap(branch.latitud, branch.longitud),
                    child: Row(
                      children: [
                        Icon(Icons.map, color: Colors.white, size: 12),
                        SizedBox(width: 3),
                        Text('MOSTRAR EN MAPA',
                            style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
