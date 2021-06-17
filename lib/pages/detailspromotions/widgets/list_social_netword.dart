import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template/models/branch_office.dart';
import 'package:url_launcher/url_launcher.dart';

Widget listScocialNetword(BuildContext context, BranchOffice branchOffice) {
  Size size = MediaQuery.of(context).size;

  return Column(
    children: [
      if (branchOffice?.url != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.url)) {
                await launch(branchOffice.url);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.chrome, color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('PÁGINA WEB',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.facebook != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.facebook)) {
                await launch(branchOffice.facebook);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(59, 89, 152, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.facebookSquare,
                    color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('FACEBOOK',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.twitter != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.twitter)) {
                await launch(branchOffice.twitter);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(0, 172, 238, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('TWITTER',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.instagram != '')
        Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunch(branchOffice.instagram)) {
                    await launch(branchOffice.instagram);
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(),
                  child: Container(
                    constraints:
                        BoxConstraints(minWidth: size.width, minHeight: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.white, size: 18),
                        SizedBox(width: 10),
                        Text('INSTAGRAM',
                            style: TextStyle(color: Colors.white, fontSize: 13))
                      ],
                    ),
                  ),
                ),
              ),
            )),
      if (branchOffice?.googlePlus != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.googlePlus)) {
                await launch(branchOffice.googlePlus);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(219, 74, 54, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.googlePlus,
                    color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('GOOGLE+',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.linkedin != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.linkedin)) {
                await launch(branchOffice.linkedin);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(14, 118, 168, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.linkedin,
                    color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('LINKEDIN',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.youtube != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.youtube)) {
                await launch(branchOffice.youtube);
              }
            },
            style:
                ElevatedButton.styleFrom(primary: Color.fromRGBO(255, 0, 0, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.youtube, color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('YOUTUBE',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        ),
      if (branchOffice?.foursquare != '')
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(branchOffice.foursquare)) {
                await launch(branchOffice.foursquare);
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(249, 79, 119, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.foursquare,
                    color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('FOURSQUARE',
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            ),
          ),
        )
    ],
  );
}
