// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HikingData.dart';
import 'Themes.dart';
import 'package:url_launcher/url_launcher.dart';

class HikingPageOnCklick extends StatelessWidget {
  final HikingData place;

  const HikingPageOnCklick({
    Key key,
    this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            color: theme.last,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    height: 60,
                    color: Colors.transparent,
                  ),
                  Text(
                    place.tittel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: theme.first,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  Image.network(
                    place.imageurl,
                    fit: BoxFit.fitWidth,
                  ),
                  Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  Text(
                    place.details,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.first,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  SizedBox.fromSize(
                    size: Size(150, 150), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.directions),
                              iconSize: 70,
                              color: iconColor,
                              onPressed: () {
                                launch(place.link);
                              },
                            ),
                            // icon
                            Text(
                              "Go",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
}
