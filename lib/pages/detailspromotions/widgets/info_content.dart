import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/setup_service.dart';
import 'package:template/models/branch_office.dart';
import 'package:template/models/promotion.dart';
import 'package:template/pages/detailspromotions/widgets/list_social_netword.dart';
import 'package:flutter/material.dart';

Widget infoContent(BuildContext context, Promotion promotion, String logo,
    BranchOffice branchOffice, bool loading) {
  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        SafeArea(
          child: Container(
            height: size.height * 0.3,
          ),
        ),
        Stack(
          children: [
            Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 3.0)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(promotion?.branchOffice ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(branchOffice?.content ?? '',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          width: 50,
                          child: Icon(Icons.loyalty,
                              color: Theme.of(context).primaryColor),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Promoción',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 6,
                              ),
                              Text(promotion.title,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  branchOffice?.promotion?.restriction != null
                                      ? '(${branchOffice?.promotion?.restriction})'
                                      : '',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 11))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          width: 50,
                          child: Icon(Icons.info,
                              color: Theme.of(context).primaryColor),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sobre nosotros',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 6,
                              ),
                              Text(branchOffice?.content ?? '',
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.justify)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          width: 50,
                          child: Icon(Icons.navigation,
                              color: Theme.of(context).primaryColor),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ver sucursales',
                                  style: TextStyle(fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                elevation: 0),
                            onPressed: () {
                              appService<NavigationService>().navigateTo(
                                  'list-branchs',
                                  arguments: branchOffice);
                            },
                            child: Text('VER',
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('¡Ponte en contacto!',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  listScocialNetword(context, branchOffice)
                ],
              ),
            ),
            Positioned.fill(
              top: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: loading
                        ? []
                        : <BoxShadow>[
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 0.0),
                                spreadRadius: 3.0)
                          ],
                  ),
                  child: loading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.pinkAccent))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(logo, fit: BoxFit.fill),
                        ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        )
      ],
    ),
  );
}
